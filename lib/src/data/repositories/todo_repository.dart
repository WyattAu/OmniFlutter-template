// data/repositories/todo_repository.dart
import 'package:flutter/foundation.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository_interface.dart';
import '../database/todo_dao.dart';
import '../supabase/supabase_service.dart';
import 'package:uuid/uuid.dart';

class TodoRepository implements TodoRepositoryInterface {
  final TodoDao _localDao;
  final SupabaseService _remoteService;
  final String _userId;

  TodoRepository({
    required TodoDao localDao,
    required SupabaseService remoteService,
    required String userId,
  })  : _localDao = localDao,
        _remoteService = remoteService,
        _userId = userId;

  @override
  Future<List<Todo>> getAllTodos() async {
    return await _localDao.getAllTodos(); 
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    return await _localDao.getTodoById(id);
  }

  @override
  Stream<List<Todo>> watchAllTodos() {
    return _localDao.watchAllTodos();
  }

  @override
  Future<Todo> addTodo(Todo todo) async {
    final newTodo = todo.id.isEmpty
        ? todo.copyWith(
            id: const Uuid().v4(),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            userId: _userId,
          )
        : todo.copyWith(
            updatedAt: DateTime.now(),
            userId: _userId,
          );

    try {
      // Save to local database first
      await _localDao.insertTodoModel(newTodo);
      
      // Attempt to sync to remote (fire and forget)
      unawaited(_syncToRemote(() async => _remoteService.insertTodo(newTodo.toJson())));
      
      return newTodo;
    } catch (e) {
      debugPrint('Failed to add todo locally: $e');
      rethrow;
    }
  }

  @override
  Future<Todo> updateTodo(Todo todo) async {
    final updatedTodo = todo.copyWith(updatedAt: DateTime.now());

    try {
      // Update local database first
      await _localDao.updateTodoModel(updatedTodo);
      
      // Attempt to sync to remote (fire and forget)
      unawaited(_syncToRemote(() async => _remoteService.updateTodo(updatedTodo.id, updatedTodo.toJson())));
      
      return updatedTodo;
    } catch (e) {
      debugPrint('Failed to update todo locally: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    try {
      // Delete from local database first
      await _localDao.deleteTodo(id);
      
      // Attempt to sync to remote (fire and forget)
      unawaited(_syncToRemote(() async => _remoteService.deleteTodo(id)));
    } catch (e) {
      debugPrint('Failed to delete todo locally: $e');
      rethrow;
    }
  }

  @override
  Future<void> sync() async {
    try {
      debugPrint('Starting sync process for user: $_userId');
      
      // Get remote todos
      final remoteTodosJson = await _remoteService.getTodos(_userId);
      final remoteTodos = remoteTodosJson
          .map((json) => _todoFromJson(json))
          .toList();

      // Get local todos
      final localTodos = await _localDao.getAllTodos();
      
      // Sync strategy: Merge remote and local (conflict resolution)
      await _mergeTodos(localTodos, remoteTodos);
      
      debugPrint('Sync completed successfully');
    } catch (e) {
      debugPrint('Sync failed: $e');
      rethrow;
    }
  }

  Future<void> _mergeTodos(List<Todo> localTodos, List<Todo> remoteTodos) async {
    // Create maps for efficient lookup
    final localMap = {for (var todo in localTodos) todo.id: todo};
    final remoteMap = {for (var todo in remoteTodos) todo.id: todo};

    // Process remote todos
    for (final remoteTodo in remoteTodos) {
      final localTodo = localMap[remoteTodo.id];
      
      if (localTodo == null) {
        // New remote todo, add to local
        await _localDao.insertTodoModel(remoteTodo);
      } else {
        // Existing todo, check timestamps for conflict resolution
        if (remoteTodo.updatedAt.isAfter(localTodo.updatedAt)) {
          // Remote is newer, update local
          await _localDao.updateTodoModel(remoteTodo);
        } else if (localTodo.updatedAt.isAfter(remoteTodo.updatedAt)) {
          // Local is newer, sync to remote (fire and forget)
          unawaited(_syncToRemote(() async => _remoteService.updateTodo(localTodo.id, localTodo.toJson())));
        }
        // If equal, no action needed
      }
    }

    // Check for local todos that don't exist remotely
    for (final localTodo in localTodos) {
      if (!remoteMap.containsKey(localTodo.id)) {
        // Local todo doesn't exist remotely, sync to remote
        unawaited(_syncToRemote(() async => _remoteService.insertTodo(localTodo.toJson())));
      }
    }
  }

  Future<void> _syncToRemote(Future<void> Function() operation) async {
    try {
      if (_remoteService.isAvailable) {
        await operation();
      }
    } catch (e) {
      debugPrint('Failed to sync to remote: $e');
      // In a production app, you might want to queue failed operations
    }
  }

  Todo _todoFromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      isCompleted: json['is_completed'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      userId: json['user_id'] as String?,
    );
  }
}