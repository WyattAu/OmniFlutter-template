import '../../models/todo.dart' as model; // Import with prefix
import 'database.dart';

class TodoDao {
  final AppDatabase _db;

  TodoDao(this._db);

  Stream<List<model.Todo>> watchAllTodos() => _db.watchAllTodos();
  Future<List<model.Todo>> getAllTodos() => _db.getAllTodos();
  Future<void> insertTodo(TodosTableCompanion entry) => _db.insertTodo(entry);
  Future<bool> updateTodo(TodosTableCompanion entry) => _db.updateTodo(entry);
  Future<void> deleteTodo(String id) => _db.deleteTodo(id);
}
