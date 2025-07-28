import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/database/database.dart';
import 'data/database/todo_dao.dart';
import 'data/supabase/supabase_client.dart';
import 'data/supabase/supabase_service.dart';
import 'bloc/todo/todo_bloc.dart';
import 'ui/screens/todo_screen.dart';
import 'bloc/todo/todo_event.dart';

class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  AppDatabase? _database;
  TodoDao? _todoDao;
  SupabaseService? _supabaseService;
  TodoBloc? _todoBloc;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeDependencies();
  }

  Future<void> _initializeDependencies() async {
    try {
      // Initialize Supabase
      await SupabaseManager().initialize();

      // Initialize local database
      _database = AppDatabase();
      _todoDao = TodoDao(_database!);

      // Initialize services
      _supabaseService = SupabaseService();

      // Initialize BLoC with dependencies
      _todoBloc = TodoBloc(
        localDao: _todoDao!,
        remoteService: _supabaseService!,
        userId: 'user-id-placeholder', // Replace with actual user ID from auth
      );

      setState(() {
        _isInitialized = true;
      });

      // Load initial data
      _todoBloc!.add(LoadTodos());
    } catch (e) {
      // Handle initialization error
      print('Initialization error: $e');
      setState(() {
        _isInitialized = true; // Still set to true to show error state
      });
    }
  }

  @override
  void dispose() {
    _todoBloc?.close();
    _database?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    if (_todoBloc == null) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Failed to initialize application')),
        ),
      );
    }

    return BlocProvider.value(value: _todoBloc!, child: TodoScreen());
  }
}
