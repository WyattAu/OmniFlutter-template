import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/dependency_container.dart';
import 'di/production_container.dart';
import 'bloc/todo/todo_bloc.dart';
import 'ui/screens/todo_screen.dart';
import 'bloc/todo/todo_event.dart';
import 'data/database/database.dart';
import 'data/database/todo_dao.dart';
import 'data/supabase/supabase_service.dart';

class TodoApp extends StatefulWidget {
  final SupabaseManagerInterface? supabaseManager;
  final DatabaseFactory? databaseFactory;
  final TodoDaoFactory? todoDaoFactory;
  final SupabaseServiceFactory? supabaseServiceFactory;
  final TodoBlocFactory? todoBlocFactory;
  final String userId;

  const TodoApp({
    super.key,
    this.supabaseManager,
    this.databaseFactory,
    this.todoDaoFactory,
    this.supabaseServiceFactory,
    this.todoBlocFactory,
    this.userId = 'user-id-placeholder',
  });

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  late final SupabaseManagerInterface _supabaseManager;
  late final DatabaseFactory _databaseFactory;
  late final TodoDaoFactory _todoDaoFactory;
  late final SupabaseServiceFactory _supabaseServiceFactory;
  late final TodoBlocFactory _todoBlocFactory;

  AppDatabase? _database;
  TodoDao? _todoDao;
  SupabaseService? _supabaseService;
  TodoBloc? _todoBloc;

  bool _isInitialized = false;
  String? _initializationError;

  @override
  void initState() {
    super.initState();

    // Initialize dependency injection
    _supabaseManager = widget.supabaseManager ?? ProductionSupabaseManager();
    _databaseFactory = widget.databaseFactory ?? ProductionDatabaseFactory();
    _todoDaoFactory = widget.todoDaoFactory ?? ProductionTodoDaoFactory();
    _supabaseServiceFactory =
        widget.supabaseServiceFactory ?? ProductionSupabaseServiceFactory();
    _todoBlocFactory = widget.todoBlocFactory ?? ProductionTodoBlocFactory();

    _initializeDependencies();
  }

  Future<void> _initializeDependencies() async {
    try {
      // Initialize Supabase
      await _supabaseManager.initialize();

      // Initialize local database
      _database = _databaseFactory.createDatabase();
      _todoDao = _todoDaoFactory.createDao(_database!);

      // Initialize services
      _supabaseService = _supabaseServiceFactory.createService();

      // Initialize BLoC with dependencies
      _todoBloc = _todoBlocFactory.createBloc(
        localDao: _todoDao!,
        remoteService: _supabaseService!,
        userId: widget.userId,
      );

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });

        // Load initial data
        _todoBloc!.add(LoadTodos());
      }
    } catch (e, stackTrace) {
      // Handle initialization error
      if (mounted) {
        setState(() {
          _initializationError = e.toString();
          _isInitialized = true; // Still set to true to show error state
        });
      }

      // Log the error with stack trace
      debugPrint('Initialization error: $e\nStack trace: $stackTrace');
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Initializing...'),
              ],
            ),
          ),
        ),
      );
    }

    if (_initializationError != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  const Text(
                    'Failed to initialize application',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _initializationError!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isInitialized = false;
                        _initializationError = null;
                      });
                      _initializeDependencies();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (_todoBloc == null) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: Text('Failed to initialize application')),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider.value(value: _todoBloc!, child: TodoScreen()),
    );
  }
}
