import 'package:injectable/injectable.dart';
import '../../features/todo/data/datasources/local/database.dart';
import '../../features/todo/data/datasources/local/todo_dao.dart';

@module
abstract class DatabaseModule {
  @preResolve
  @lazySingleton
  Future<AppDatabase> get database async {
    final db = AppDatabase();
    // Test connection
    await db.testConnection();
    return db;
  }

  @lazySingleton
  TodoDao todoDao(AppDatabase database) => TodoDao(database);
}
