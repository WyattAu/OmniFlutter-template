import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

/// Default implementation that throws on unsupported platforms
final QueryExecutor executor = LazyDatabase(() async {
  debugPrint('Unsupported platform - throwing error');
  throw UnsupportedError(
    'Platform not supported. Please use database_impl_io.dart or database_impl_web.dart',
  );
});
