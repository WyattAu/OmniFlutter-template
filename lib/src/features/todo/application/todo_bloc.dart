import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/entities/todo.dart';
import '../domain/repositories/todo_repository.dart';
import '../../../core/error/failure.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

// Remove @injectable from here since we're registering it in the module
//@injectable
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository;

  TodoBloc(this._repository) : super(const TodoState.initial()) {
    on<LoadTodos>((event, emit) async => await _onLoadTodos(event, emit));
    on<AddTodo>((event, emit) async => await _onAddTodo(event, emit));
    on<UpdateTodo>((event, emit) async => await _onUpdateTodo(event, emit));
    on<DeleteTodo>((event, emit) async => await _onDeleteTodo(event, emit));
    on<ToggleTodoCompletion>(
      (event, emit) async => await _onToggleTodoCompletion(event, emit),
    );
    on<SyncTodos>((event, emit) async => await _onSyncTodos(event, emit));
    on<FilterTodos>((event, emit) async => await _onUpdateFilter(event, emit));
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(const TodoState.loading());
    final result = await _repository.getAllTodos();
    result.fold(
      (failure) => emit(TodoState.error(failure)),
      (todos) => emit(TodoState.loaded(todos: todos)),
    );
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    final currentState = state;
    if (currentState is! TodoStateLoaded) return;

    final result = await _repository.addTodo(event.todo);
    result.fold(
      (failure) => emit(TodoState.error(failure)),
      (newTodo) => emit(
        TodoState.loaded(
          todos: [...currentState.todos, newTodo],
          filter: currentState.filter,
        ),
      ),
    );
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    final currentState = state;
    if (currentState is! TodoStateLoaded) return;

    final result = await _repository.updateTodo(event.todo);
    result.fold((failure) => emit(TodoState.error(failure)), (updatedTodo) {
      final index = currentState.todos.indexWhere(
        (t) => t.id == updatedTodo.id,
      );
      if (index != -1) {
        final updatedTodos = List<Todo>.from(currentState.todos)
          ..[index] = updatedTodo;
        emit(
          TodoState.loaded(todos: updatedTodos, filter: currentState.filter),
        );
      }
    });
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    final currentState = state;
    if (currentState is! TodoStateLoaded) return;

    final result = await _repository.deleteTodo(event.todoId);
    result.fold(
      (failure) => emit(TodoState.error(failure)),
      (_) => emit(
        TodoState.loaded(
          todos: currentState.todos
              .where((todo) => todo.id != event.todoId)
              .toList(),
          filter: currentState.filter,
        ),
      ),
    );
  }

  Future<void> _onToggleTodoCompletion(
    ToggleTodoCompletion event,
    Emitter<TodoState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TodoStateLoaded) return;

    final index = currentState.todos.indexWhere((t) => t.id == event.todoId);
    if (index == -1) return;

    final todo = currentState.todos[index];
    final updatedTodo = todo.copyWith(
      isCompleted: event.isCompleted,
      updatedAt: DateTime.now(),
    );

    // Optimistically update UI
    final updatedTodos = List<Todo>.from(currentState.todos)
      ..[index] = updatedTodo;
    emit(TodoState.loaded(todos: updatedTodos, filter: currentState.filter));

    // Persist changes
    add(TodoEvent.updateTodo(updatedTodo));
  }

  Future<void> _onSyncTodos(SyncTodos event, Emitter<TodoState> emit) async {
    final currentState = state;
    if (currentState is! TodoStateLoaded) return;

    emit(
      TodoState.loaded(
        todos: currentState.todos,
        filter: currentState.filter,
        isSyncing: true,
      ),
    );

    final result = await _repository.syncTodos();
    result.fold(
      (failure) {
        emit(
          TodoState.loaded(
            todos: currentState.todos,
            filter: currentState.filter,
            isSyncing: false,
          ),
        );
        emit(TodoState.error(failure));
      },
      (_) {
        // Reload todos after sync
        add(const TodoEvent.loadTodos());
      },
    );
  }

  Future<void> _onUpdateFilter(
    FilterTodos event,
    Emitter<TodoState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TodoStateLoaded) return;

    emit(
      TodoState.loaded(
        todos: currentState.todos,
        filter: event.filter,
        isSyncing: currentState.isSyncing,
      ),
    );
  }
}
