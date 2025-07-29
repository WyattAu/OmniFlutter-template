import '../data/database/database.dart';
import '../data/database/todo_dao.dart';
import '../data/supabase/supabase_service.dart';
import '../domain/repositories/todo_repository_interface.dart';
import '../bloc/todo/todo_bloc.dart';

abstract class SupabaseManagerInterface {
  Future<void> initialize();
  bool get isInitialized;
}

abstract class DatabaseFactory {
  AppDatabase createDatabase();
}

abstract class TodoDaoFactory {
  TodoDao createDao(AppDatabase database);
}

abstract class SupabaseServiceFactory {
  SupabaseService createService();
}

abstract class TodoRepositoryFactory {
  TodoRepositoryInterface createRepository({
    required TodoDao localDao,
    required SupabaseService remoteService,
    required String userId,
  });
}

abstract class TodoBlocFactory {
  TodoBloc createBloc(TodoRepositoryInterface repository);
}