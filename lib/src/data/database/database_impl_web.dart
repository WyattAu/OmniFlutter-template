import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';

QueryExecutor _openConnection() {
  debugPrint('Opening web database connection...');
  return LazyDatabase(() async {
    try {
      debugPrint('Initializing WasmDatabase...');

      final result = await WasmDatabase.open(
        databaseName: 'app_db',
        sqlite3Uri: Uri.parse('sqlite3.wasm'),
        driftWorkerUri: Uri.parse('drift_worker.dart.js'),
      );

      if (result.missingFeatures.isNotEmpty) {
        debugPrint(
          'Using ${result.chosenImplementation} due to missing browser '
          'features: ${result.missingFeatures}',
        );
      } else {
        debugPrint('Database initialized with: ${result.chosenImplementation}');
      }

      debugPrint('Web database initialized successfully');
      return result.resolvedExecutor;
    } catch (e, stackTrace) {
      debugPrint('Failed to initialize web database: $e');
      debugPrint('Stack trace: $stackTrace');
      rethrow;
    }
  });
}

final QueryExecutor executor = _openConnection();
