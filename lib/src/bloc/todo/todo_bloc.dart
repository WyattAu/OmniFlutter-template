import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column;
import '../../data/database/database.dart';
import '../../data/database/todo_dao.dart';
import '../../data/supabase/supabase_service.dart';
import '../../models/todo.dart' as model; // Import with prefix
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoDao localDao;
  final SupabaseService remoteService;
  final String userId;

  TodoBloc({
    required this.localDao,
    required this.remoteService,
    required this.userId,
  }) : super(TodoLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<ToggleTodoCompletion>(_onToggleTodoCompletion);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      // Load from local database first
      final localTodos = await localDao.getAllTodos();
      emit(TodoLoaded(todos: localTodos, filter: Filter.all));

      // Sync with remote database
      final remoteTodos = await remoteService.getTodos(userId);
      final todos = remoteTodos
          .map((json) => model.Todo.fromJson(json))
          .toList();

      emit(TodoLoaded(todos: todos, filter: Filter.all));
    } catch (e) {
      emit(TodoError('Failed to load todos: ${e.toString()}'));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    try {
      final newTodo = event.todo.copyWith(
        id: const Uuid().v4(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userId: userId,
      );

      // Save to local DB
      final todoCompanion = _toCompanion(newTodo, true);
      await localDao.insertTodo(todoCompanion);

      // Sync with remote
      await remoteService.insertTodo(newTodo.toJson());

      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        final updatedTodos = List<model.Todo>.from(currentState.todos)
          ..add(newTodo);
        emit(currentState.copyWith(todos: updatedTodos));
      }
    } catch (e) {
      emit(TodoError('Failed to add todo: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    try {
      final updatedTodo = event.todo.copyWith(updatedAt: DateTime.now());

      // Update local DB
      final todoCompanion = _toCompanion(updatedTodo, true);
      await localDao.updateTodo(todoCompanion);

      // Sync with remote
      await remoteService.updateTodo(updatedTodo.id, updatedTodo.toJson());

      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        final index = currentState.todos.indexWhere(
          (t) => t.id == updatedTodo.id,
        );
        if (index != -1) {
          final updatedTodos = List<model.Todo>.from(currentState.todos)
            ..[index] = updatedTodo;
          emit(currentState.copyWith(todos: updatedTodos));
        }
      }
    } catch (e) {
      emit(TodoError('Failed to update todo: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    try {
      // Delete from local DB
      await localDao.deleteTodo(event.todoId);

      // Sync with remote
      await remoteService.deleteTodo(event.todoId);

      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        final updatedTodos = currentState.todos
            .where((todo) => todo.id != event.todoId)
            .toList();
        emit(currentState.copyWith(todos: updatedTodos));
      }
    } catch (e) {
      emit(TodoError('Failed to delete todo: ${e.toString()}'));
    }
  }

  Future<void> _onToggleTodoCompletion(
    ToggleTodoCompletion event,
    Emitter<TodoState> emit,
  ) async {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;
      final index = currentState.todos.indexWhere((t) => t.id == event.todoId);
      if (index != -1) {
        final updatedTodo = currentState.todos[index].copyWith(
          isCompleted: event.isCompleted,
          updatedAt: DateTime.now(),
        );

        add(UpdateTodo(updatedTodo));
      }
    }
  }

  TodosTableCompanion _toCompanion(model.Todo todo, bool updateId) {
    return TodosTableCompanion(
      id: updateId ? Value(todo.id) : const Value.absent(),
      title: Value(todo.title),
      description: Value(todo.description),
      isCompleted: Value(todo.isCompleted),
      createdAt: Value(todo.createdAt),
      updatedAt: Value(todo.updatedAt),
      userId: Value(todo.userId),
    );
  }
}
