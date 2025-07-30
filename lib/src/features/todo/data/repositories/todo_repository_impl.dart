import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/local/todo_dao.dart';
import '../datasources/remote/supabase_service.dart';
import 'package:uuid/uuid.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDao _localDao;
  final SupabaseService _remoteService;
  final String _userId;

  TodoRepositoryImpl({
    required TodoDao localDao,
    required SupabaseService remoteService,
    required String userId,
  }) : _localDao = localDao,
       _remoteService = remoteService,
       _userId = userId;

  @override
  Stream<Either<Failure, List<Todo>>> watchAllTodos() {
    return _localDao.watchAllTodos().map((todos) => right(todos));
  }

  @override
  Future<Either<Failure, List<Todo>>> getAllTodos() async {
    try {
      final todos = await _localDao.getAllTodos();
      return right(todos);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get all todos', e, stackTrace);
      return left(
        const Failure.cache('Failed to retrieve todos from local cache'),
      );
    }
  }

  @override
  Future<Either<Failure, Todo>> addTodo(Todo todo) async {
    try {
      final newTodo = todo.id.isEmpty
          ? todo.copyWith(
              id: const Uuid().v4(),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              userId: _userId,
            )
          : todo.copyWith(updatedAt: DateTime.now(), userId: _userId);

      await _localDao.insertTodo(newTodo);
      _syncToRemote(() => _remoteService.insertTodo(newTodo.toJson()));
      return right(newTodo);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to add todo', e, stackTrace);
      return left(const Failure.cache('Failed to add todo to local cache'));
    }
  }

  @override
  Future<Either<Failure, Todo>> updateTodo(Todo todo) async {
    try {
      final updatedTodo = todo.copyWith(updatedAt: DateTime.now());
      await _localDao.updateTodo(updatedTodo);
      _syncToRemote(
        () => _remoteService.updateTodo(updatedTodo.id, updatedTodo.toJson()),
      );
      return right(updatedTodo);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to update todo', e, stackTrace);
      return left(const Failure.cache('Failed to update todo in local cache'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTodo(String id) async {
    try {
      await _localDao.deleteTodo(id);
      _syncToRemote(() => _remoteService.deleteTodo(id));
      return right(unit);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to delete todo', e, stackTrace);
      return left(
        const Failure.cache('Failed to delete todo from local cache'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> syncTodos() async {
    try {
      if (!_remoteService.isAvailable) return right(unit);

      final remoteTodos = (await _remoteService.getTodos(
        _userId,
      )).map((json) => Todo.fromJson(json)).toList();

      final localTodos = await _localDao.getAllTodos();
      await _mergeTodos(localTodos, remoteTodos);
      return right(unit);
    } catch (e, stackTrace) {
      AppLogger.error('Sync failed', e, stackTrace);
      return left(const Failure.server('Failed to sync todos'));
    }
  }

  Future<void> _mergeTodos(
    List<Todo> localTodos,
    List<Todo> remoteTodos,
  ) async {
    final localMap = {for (var todo in localTodos) todo.id: todo};
    final remoteMap = {for (var todo in remoteTodos) todo.id: todo};

    for (final remoteTodo in remoteTodos) {
      final localTodo = localMap[remoteTodo.id];

      if (localTodo == null) {
        await _localDao.insertTodo(remoteTodo);
      } else if (remoteTodo.updatedAt.isAfter(localTodo.updatedAt)) {
        await _localDao.updateTodo(remoteTodo);
      } else if (localTodo.updatedAt.isAfter(remoteTodo.updatedAt)) {
        _syncToRemote(
          () => _remoteService.updateTodo(localTodo.id, localTodo.toJson()),
        );
      }
    }

    for (final localTodo in localTodos) {
      if (!remoteMap.containsKey(localTodo.id)) {
        _syncToRemote(() => _remoteService.insertTodo(localTodo.toJson()));
      }
    }
  }

  Future<void> _syncToRemote(Future<void> Function() operation) async {
    try {
      if (_remoteService.isAvailable) await operation();
    } catch (e, stackTrace) {
      AppLogger.error('Failed to sync to remote', e, stackTrace);
    }
  }
}
