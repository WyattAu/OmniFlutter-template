import '../../models/todo.dart' as model;
import '../database/database.dart';

class TodoDao {
  final AppDatabase _db;

  TodoDao(this._db);

  // These methods now return your model types, not Drift types
  Stream<List<model.Todo>> watchAllTodos() => _db.watchAllTodos();
  Future<List<model.Todo>> getAllTodos() => _db.getAllTodos();

  // Insert using Drift's companion
  Future<void> insertTodo(TodosTableCompanion entry) => _db.insertTodo(entry);

  // Insert using your model directly
  Future<void> insertTodoModel(model.Todo todo) => _db.insertTodoModel(todo);

  // Update using Drift's companion
  Future<bool> updateTodo(TodosTableCompanion entry) => _db.updateTodo(entry);

  // Update using your model directly
  Future<bool> updateTodoModel(model.Todo todo) => _db.updateTodoModel(todo);

  Future<void> deleteTodo(String id) => _db.deleteTodo(id);
}
