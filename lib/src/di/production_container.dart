// di/production_container.dart (updated)
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/database/database.dart';
import '../data/database/todo_dao.dart';
import '../data/supabase/supabase_client.dart';
import '../data/supabase/supabase_service.dart';
import '../data/repositories/todo_repository.dart';
import '../domain/repositories/todo_repository_interface.dart';
import '../bloc/todo/todo_bloc.dart';
import 'dependency_container.dart';

class ProductionSupabaseManager implements SupabaseManagerInterface {
  final SupabaseManager _manager = SupabaseManager();

  @override
  Future<void> initialize() => _manager.initialize();

  @override
  bool get isInitialized => _manager.isInitialized;
}

class _ConcreteAppDatabase extends AppDatabase {
  _ConcreteAppDatabase() : super();
}

class ProductionDatabaseFactory implements DatabaseFactory {
  @override
  AppDatabase createDatabase() {
    try {
      return _ConcreteAppDatabase();
    } catch (e) {
      throw Exception('Failed to create database: $e');
    }
  }
}

class ProductionTodoDaoFactory implements TodoDaoFactory {
  @override
  TodoDao createDao(AppDatabase database) {
    try {
      return TodoDao(database);
    } catch (e) {
      throw Exception('Failed to create TodoDao: $e');
    }
  }
}

class ProductionSupabaseServiceFactory implements SupabaseServiceFactory {
  @override
  SupabaseService createService() {
    try {
      return SupabaseService();
    } catch (e) {
      throw Exception('Failed to create SupabaseService: $e');
    }
  }
}

class ProductionTodoRepositoryFactory implements TodoRepositoryFactory {
  @override
  TodoRepositoryInterface createRepository({
    required TodoDao localDao,
    required SupabaseService remoteService,
    required String userId,
  }) {
    try {
      return TodoRepository(
        localDao: localDao,
        remoteService: remoteService,
        userId: userId,
      );
    } catch (e) {
      throw Exception('Failed to create TodoRepository: $e');
    }
  }
}

class ProductionTodoBlocFactory implements TodoBlocFactory {
  @override
  TodoBloc createBloc(TodoRepositoryInterface repository) {
    try {
      return TodoBloc(repository: repository);
    } catch (e) {
      throw Exception('Failed to create TodoBloc: $e');
    }
  }
}