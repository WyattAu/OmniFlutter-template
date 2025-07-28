import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../models/todo.dart' as model;

part 'database.g.dart';

class TodosTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get userId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [TodosTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      // Get the documents directory path
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    });
  }

  Future<List<model.Todo>> getAllTodos() async {
    final result = await customSelect('SELECT * FROM todos_table').get();
    return result.map((row) => _rowToTodo(row)).toList();
  }

  Stream<List<model.Todo>> watchAllTodos() {
    return customSelect(
      'SELECT * FROM todos_table',
    ).watch().map((rows) => rows.map((row) => _rowToTodo(row)).toList());
  }

  Future<model.Todo?> getTodoById(String id) async {
    final result = await customSelect(
      'SELECT * FROM todos_table WHERE id = ?',
      variables: [Variable.withString(id)],
    ).getSingleOrNull();

    return result != null ? _rowToTodo(result) : null;
  }

  Future<int> insertTodo(TodosTableCompanion entry) =>
      into(todosTable).insert(entry);
  Future<bool> updateTodo(TodosTableCompanion entry) =>
      update(todosTable).replace(entry);
  Future<int> deleteTodo(String id) =>
      (delete(todosTable)..where((t) => t.id.equals(id))).go();

  model.Todo _rowToTodo(QueryRow row) {
    return model.Todo(
      id: row.read<String>('id'),
      title: row.read<String>('title'),
      description: row.read<String?>('description'),
      isCompleted: row.read<bool>('is_completed'),
      createdAt: row.read<DateTime>('created_at'),
      updatedAt: row.read<DateTime>('updated_at'),
      userId: row.read<String?>('user_id'),
    );
  }
}
