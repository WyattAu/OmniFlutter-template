part of 'todo_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.loadTodos() = LoadTodos;
  const factory TodoEvent.addTodo(Todo todo) = AddTodo;
  const factory TodoEvent.updateTodo(Todo todo) = UpdateTodo;
  const factory TodoEvent.deleteTodo(String todoId) = DeleteTodo;
  const factory TodoEvent.toggleTodoCompletion(
    String todoId,
    bool isCompleted,
  ) = ToggleTodoCompletion;
  const factory TodoEvent.syncTodos() = SyncTodos;
  const factory TodoEvent.filterTodos(Filter filter) = FilterTodos;
}
