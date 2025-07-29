import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

QueryExecutor _openConnection() {
  debugPrint('Opening native database connection...');
  return LazyDatabase(() async {
    try {
      debugPrint('Getting application documents directory...');
      final dbFolder = await getApplicationDocumentsDirectory();
      debugPrint('Database folder: ${dbFolder.path}');

      // Ensure directory exists
      await dbFolder.create(recursive: true);
      debugPrint('Created database directory');

      // Use path package for cross-platform path handling
      final dbPath = p.join(dbFolder.path, 'app.db');
      final file = File(dbPath);
      debugPrint('Database file path: $dbPath');

      // Ensure parent directory exists
      await file.parent.create(recursive: true);

      // Ensure file exists
      if (!await file.exists()) {
        await file.create(recursive: true);
        debugPrint('Created database file');
      }

      debugPrint('Creating NativeDatabase...');
      final database = NativeDatabase(file);
      debugPrint('Native database initialized successfully');
      return database;
    } catch (e, stackTrace) {
      debugPrint('Failed to open native database: $e');
      debugPrint('Stack trace: $stackTrace');
      // Re-throw with more context
      Error.throwWithStackTrace(
        Exception('Failed to initialize database: $e'),
        stackTrace,
      );
    }
  });
}

final QueryExecutor executor = _openConnection();
