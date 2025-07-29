import 'package:drift/drift.dart';
import 'database_impl.dart'
    if (dart.library.io) 'database_impl_io.dart'
    if (dart.library.html) 'database_impl_web.dart'
    as impl;

import '../../models/todo.dart' as model;
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
abstract class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.executor) {
    debugPrint('AppDatabase constructor called');
  }

  @override
  int get schemaVersion => 1;

  // Migration strategy
  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      debugPrint('Before opening database');
      await customStatement('PRAGMA foreign_keys = ON');
    },
    onCreate: (Migrator m) {
      debugPrint('Creating database tables');
      return m.createAll();
    },
    onUpgrade: (m, from, to) async {
      debugPrint('Upgrading database from $from to $to');
      // Handle migrations here if needed
    },
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

  // Modern Drift queries with automatic mapping
  Future<List<model.Todo>> getAllTodos() async {
    debugPrint('Getting all todos...');
    try {
      final todos = await select(todosTable).get();
      debugPrint('Retrieved ${todos.length} todos');
      return todos.map((todo) => _toModel(todo)).toList();
    } catch (e, stackTrace) {
      debugPrint('Error getting todos: $e');
      debugPrint('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Stream<List<model.Todo>> watchAllTodos() {
    debugPrint('Watching all todos...');
    return select(
      todosTable,
    ).watch().map((todos) => todos.map((todo) => _toModel(todo)).toList());
  }

  Future<model.Todo?> getTodoById(String id) async {
    debugPrint('Getting todo by id: $id');
    try {
      final todo = await (select(
        todosTable,
      )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
      debugPrint('Todo found: ${todo != null}');
      return todo != null ? _toModel(todo) : null;
    } catch (e, stackTrace) {
      debugPrint('Error getting todo by id: $e');
      debugPrint('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<int> insertTodo(TodosTableCompanion entry) async {
    debugPrint('Inserting todo...');
    try {
      final result = await into(todosTable).insert(entry);
      debugPrint('Todo inserted with id: $result');
      return result;
    } catch (e, stackTrace) {
      debugPrint('Error inserting todo: $e');
      debugPrint('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<bool> updateTodo(TodosTableCompanion entry) async {
    debugPrint('Updating todo...');
    try {
      final result = await update(todosTable).replace(entry);
      debugPrint('Todo updated: $result');
      return result;
    } catch (e, stackTrace) {
      debugPrint('Error updating todo: $e');
      debugPrint('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<int> deleteTodo(String id) async {
    debugPrint('Deleting todo with id: $id');
    try {
      final result = await (delete(
        todosTable,
      )..where((tbl) => tbl.id.equals(id))).go();
      debugPrint('Todos deleted: $result');
      return result;
    } catch (e, stackTrace) {
      debugPrint('Error deleting todo: $e');
      debugPrint('Stack trace: $stackTrace');
      rethrow;
    }
  }

  // Helper method to insert your model directly
  Future<int> insertTodoModel(model.Todo todo) async {
    debugPrint('Inserting todo model...');
    return await insertTodo(_toCompanion(todo));
  }

  // Helper method to update your model directly
  Future<bool> updateTodoModel(model.Todo todo) async {
    debugPrint('Updating todo model...');
    return await updateTodo(_toCompanion(todo));
  }

  // Private helper to convert Drift data to your model
  model.Todo _toModel(TodosTableData todo) {
    return model.Todo(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
      createdAt: todo.createdAt,
      updatedAt: todo.updatedAt,
      userId: todo.userId,
    );
  }

  // Private helper to convert your model to Drift companion
  TodosTableCompanion _toCompanion(model.Todo todo) {
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
