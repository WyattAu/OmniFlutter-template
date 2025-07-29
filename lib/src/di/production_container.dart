import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/database/database.dart';
import '../data/database/todo_dao.dart';
import '../data/supabase/supabase_client.dart';
import '../data/supabase/supabase_service.dart';
import '../bloc/todo/todo_bloc.dart';
import 'dependency_container.dart';

class ProductionSupabaseManager implements SupabaseManagerInterface {
  final SupabaseManager _manager = SupabaseManager();

  @override
  Future<void> initialize() => _manager.initialize();

  @override
  SupabaseClient get client => _manager.client;

  @override
  bool get isInitialized => _manager.isInitialized; // Now this works!
}

class ProductionDatabaseFactory implements DatabaseFactory {
  @override
  AppDatabase createDatabase() => AppDatabase();
}

class ProductionTodoDaoFactory implements TodoDaoFactory {
  @override
  TodoDao createDao(AppDatabase database) => TodoDao(database);
}

class ProductionSupabaseServiceFactory implements SupabaseServiceFactory {
  @override
  SupabaseService createService() => SupabaseService();
}

class ProductionTodoBlocFactory implements TodoBlocFactory {
  @override
  TodoBloc createBloc({
    required TodoDao localDao,
    required SupabaseService remoteService,
    required String userId,
  }) {
    return TodoBloc(
      localDao: localDao,
      remoteService: remoteService,
      userId: userId,
    );
  }
}
