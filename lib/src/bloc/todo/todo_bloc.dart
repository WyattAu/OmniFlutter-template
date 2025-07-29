import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/todo_repository_interface.dart';
import '../../domain/entities/todo.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepositoryInterface _repository;

  TodoBloc({required TodoRepositoryInterface repository})
    : _repository = repository,
      super(TodoLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<ToggleTodoCompletion>(_onToggleTodoCompletion);
    on<SyncTodos>(_onSyncTodos);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      // Start watching todos (real-time updates)
      await _repository.sync();

      final todos = await _repository.getAllTodos();
      emit(TodoLoaded(todos: todos, filter: Filter.all));
    } catch (e) {
      emit(TodoError('Failed to load todos: $e'));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    try {
      final newTodo = await _repository.addTodo(event.todo);

      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        final updatedTodos = List<Todo>.from(currentState.todos)..add(newTodo);
        emit(currentState.copyWith(todos: updatedTodos));
      }
    } catch (e) {
      emit(TodoError('Failed to add todo: $e'));
    }
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    try {
      final updatedTodo = await _repository.updateTodo(event.todo);

      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        final index = currentState.todos.indexWhere(
          (t) => t.id == updatedTodo.id,
        );
        if (index != -1) {
          final updatedTodos = List<Todo>.from(currentState.todos)
            ..[index] = updatedTodo;
          emit(currentState.copyWith(todos: updatedTodos));
        }
      }
    } catch (e) {
      emit(TodoError('Failed to update todo: $e'));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    try {
      await _repository.deleteTodo(event.todoId);

      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        final updatedTodos = currentState.todos
            .where((todo) => todo.id != event.todoId)
            .toList();
        emit(currentState.copyWith(todos: updatedTodos));
      }
    } catch (e) {
      emit(TodoError('Failed to delete todo: $e'));
    }
  }

  Future<void> _onToggleTodoCompletion(
    ToggleTodoCompletion event,
    Emitter<TodoState> emit,
  ) async {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;
      final index = currentState.todos.indexWhere((t) => t.id == event.todoId);
      if (index == -1) return;

      final todo = currentState.todos[index];
      final updatedTodo = todo.copyWith(
        isCompleted: event.isCompleted,
        updatedAt: DateTime.now(),
      );

      // Immediately emit updated list
      final updatedTodos = List<Todo>.from(currentState.todos)
        ..[index] = updatedTodo;

      emit(currentState.copyWith(todos: updatedTodos));

      // Then asynchronously persist
      add(UpdateTodo(updatedTodo));
    }
  }

  Future<void> _onSyncTodos(SyncTodos event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;
      emit(currentState.copyWith(isSyncing: true));

      try {
        await _repository.sync();
        final todos = await _repository.getAllTodos();
        emit(TodoLoaded(todos: todos, filter: currentState.filter));
      } catch (e) {
        emit(currentState.copyWith(isSyncing: false));
        emit(TodoError('Sync failed: $e'));
      }
    }
  }
}
