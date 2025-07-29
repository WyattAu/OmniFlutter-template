import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/database/database.dart';
import '../data/database/todo_dao.dart';
import '../data/supabase/supabase_service.dart';
import '../bloc/todo/todo_bloc.dart';

abstract class SupabaseManagerInterface {
  Future<void> initialize();
  SupabaseClient get client;
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

abstract class TodoBlocFactory {
  TodoBloc createBloc({
    required TodoDao localDao,
    required SupabaseService remoteService,
    required String userId,
  });
}
