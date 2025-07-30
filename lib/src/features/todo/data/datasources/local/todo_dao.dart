import 'package:drift/drift.dart';
import '../../../domain/entities/todo.dart';
import 'database.dart';

class TodoDao {
  final AppDatabase _db;

  TodoDao(this._db);

  Stream<List<Todo>> watchAllTodos() {
    return _db.watchAllTodos().map((todos) => todos.map(_toDomain).toList());
  }

  Future<List<Todo>> getAllTodos() async {
    final todos = await _db.getAllTodos();
    return todos.map(_toDomain).toList();
  }

  Future<void> insertTodo(Todo todo) {
    return _db.insertTodo(_toCompanion(todo));
  }

  Future<void> updateTodo(Todo todo) {
    return _db.updateTodo(_toCompanion(todo));
  }

  Future<void> deleteTodo(String id) {
    return _db.deleteTodo(id);
  }

  Future<void> clearTodos() => _db.clearTodos();

  Todo _toDomain(TodosTableData data) {
    return Todo(
      id: data.id,
      title: data.title,
      description: data.description,
      isCompleted: data.isCompleted,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      userId: data.userId,
    );
  }

  TodosTableCompanion _toCompanion(Todo todo) {
    return TodosTableCompanion(
      id: Value(todo.id),
      title: Value(todo.title),
      description: Value(todo.description),
      isCompleted: Value(todo.isCompleted),
      createdAt: Value(todo.createdAt),
      updatedAt: Value(todo.updatedAt),
      userId: Value(todo.userId),
    );
  }
}
