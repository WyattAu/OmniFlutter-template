import '../entities/todo.dart';

abstract class TodoRepositoryInterface {
  Future<List<Todo>> getAllTodos();
  Future<Todo?> getTodoById(String id);
  Stream<List<Todo>> watchAllTodos();
  Future<Todo> addTodo(Todo todo);
  Future<Todo> updateTodo(Todo todo);
  Future<void> deleteTodo(String id);
  Future<void> sync();
}