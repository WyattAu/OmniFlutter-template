import 'package:injectable/injectable.dart';
import '../../features/todo/application/todo_bloc.dart';
import '../../features/todo/data/repositories/todo_repository_impl.dart';
import '../../features/todo/data/datasources/remote/supabase_service.dart';
import '../../features/todo/domain/repositories/todo_repository.dart';
import '../../features/todo/data/datasources/local/todo_dao.dart';

@module
abstract class TodoModule {
  @lazySingleton
  SupabaseService get supabaseService => SupabaseService();

  @lazySingleton
  TodoRepository todoRepository(
    TodoDao todoDao,
    SupabaseService supabaseService,
  ) {
    return TodoRepositoryImpl(
      localDao: todoDao,
      remoteService: supabaseService,
      userId: 'default-user-id',
    );
  }

  // Add this registration
  @lazySingleton
  TodoBloc todoBloc(TodoRepository repository) => TodoBloc(repository);
}
