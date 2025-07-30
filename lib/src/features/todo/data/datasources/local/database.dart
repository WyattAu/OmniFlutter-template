import 'package:drift/drift.dart';
import 'database_impl.dart'
    if (dart.library.io) 'database_impl_io.dart'
    if (dart.library.html) 'database_impl_web.dart'
    as impl;
import 'package:flutter/foundation.dart';

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
  AppDatabase() : super(impl.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {},
  );

  // Test connection method
  Future<void> testConnection() async {
    debugPrint('Testing database connection...');
    try {
      final result = await customSelect('SELECT 1 as result').get();
      debugPrint(
        'Database connection test successful: ${result.first.data['result']}',
      );
    } catch (e, stackTrace) {
      debugPrint('Database connection test failed: $e');
      debugPrint('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<List<TodosTableData>> getAllTodos() => select(todosTable).get();
  Stream<List<TodosTableData>> watchAllTodos() => select(todosTable).watch();
  Future<TodosTableData?> getTodoById(String id) async {
    return await (select(
      todosTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertTodo(TodosTableCompanion entry) =>
      into(todosTable).insert(entry);

  Future<bool> updateTodo(TodosTableCompanion entry) =>
      update(todosTable).replace(entry);

  Future<int> deleteTodo(String id) async {
    return await (delete(todosTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> clearTodos() => delete(todosTable).go();
}
