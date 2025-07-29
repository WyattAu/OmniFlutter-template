import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/database/database.dart';
import '../data/database/todo_dao.dart';
import '../data/supabase/supabase_service.dart';
import '../bloc/todo/todo_bloc.dart';
import 'dependency_container.dart';

class MockSupabaseManager extends Mock implements SupabaseManagerInterface {}

class MockDatabaseFactory extends Mock implements DatabaseFactory {}

class MockTodoDaoFactory extends Mock implements TodoDaoFactory {}

class MockSupabaseServiceFactory extends Mock
    implements SupabaseServiceFactory {}

class MockTodoBlocFactory extends Mock implements TodoBlocFactory {}

class MockAppDatabase extends Mock implements AppDatabase {}

class MockTodoDao extends Mock implements TodoDao {}

class MockSupabaseService extends Mock implements SupabaseService {}

class MockTodoBloc extends Mock implements TodoBloc {}

class MockSupabaseClient extends Mock implements SupabaseClient {}
