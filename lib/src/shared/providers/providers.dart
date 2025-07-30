import 'package:get_it/get_it.dart';
import '../../features/todo/application/todo_bloc.dart';
import '../../features/todo/data/datasources/local/database.dart';
import '../../features/todo/data/datasources/local/todo_dao.dart';
import '../../features/todo/data/datasources/remote/supabase_service.dart';
import '../../features/todo/data/repositories/todo_repository_impl.dart';
import '../../features/todo/domain/repositories/todo_repository.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  // Register database
  getIt.registerLazySingletonAsync<AppDatabase>(() async {
    final db = AppDatabase();
    await db.testConnection();
    return db;
  });

  // Register DAO
  getIt.registerLazySingletonAsync<TodoDao>(() async {
    final db = await getIt.getAsync<AppDatabase>();
    return TodoDao(db);
  });

  // Register services
  getIt.registerLazySingleton<SupabaseService>(() => SupabaseService());

  // Register repository
  getIt.registerLazySingletonAsync<TodoRepository>(() async {
    final dao = await getIt.getAsync<TodoDao>();
    final service = getIt<SupabaseService>();
    return TodoRepositoryImpl(
      localDao: dao,
      remoteService: service,
      userId: 'default-user-id',
    );
  });

  // Register bloc
  getIt.registerFactoryAsync<TodoBloc>(() async {
    final repository = await getIt.getAsync<TodoRepository>();
    return TodoBloc(repository);
  });
}
