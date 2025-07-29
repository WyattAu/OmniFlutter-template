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
import 'domain/repositories/todo_repository_interface.dart'; // Add this import

class TodoApp extends StatefulWidget {
  final SupabaseManagerInterface? supabaseManager;
  final DatabaseFactory? databaseFactory;
  final TodoDaoFactory? todoDaoFactory;
  final SupabaseServiceFactory? supabaseServiceFactory;
  final TodoRepositoryFactory? todoRepositoryFactory; // Add this
  final TodoBlocFactory? todoBlocFactory;
  final String userId;

  const TodoApp({
    super.key,
    this.supabaseManager,
    this.databaseFactory,
    this.todoDaoFactory,
    this.supabaseServiceFactory,
    this.todoRepositoryFactory, // Add this
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
  late final TodoRepositoryFactory _todoRepositoryFactory; // Add this
  late final TodoBlocFactory _todoBlocFactory;

  AppDatabase? _database;
  TodoDao? _todoDao;
  SupabaseService? _supabaseService;
  TodoRepositoryInterface? _todoRepository; // Change type
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
    _todoRepositoryFactory =
        widget.todoRepositoryFactory ?? ProductionTodoRepositoryFactory(); // Add this
    _todoBlocFactory = widget.todoBlocFactory ?? ProductionTodoBlocFactory();

    _initializeDependencies();
  }

  Future<void> _initializeDependencies() async {
    try {
      debugPrint('Starting application initialization...');
      
      // Initialize Supabase (non-fatal if fails)
      debugPrint('Initializing Supabase...');
      try {
        await _supabaseManager.initialize();
        debugPrint('Supabase initialization completed (success or skipped)');
      } catch (e, stackTrace) {
        debugPrint('Supabase initialization failed (continuing anyway): $e');
        debugPrint('Stack trace: $stackTrace');
      }

      // Initialize local database 
      debugPrint('Creating database...');
      _database = _databaseFactory.createDatabase();
      debugPrint('Database created, testing connection...');
      
      // Test database connection
      await _database!.testConnection();
      debugPrint('Database connection successful');
      
      _todoDao = _todoDaoFactory.createDao(_database!);
      debugPrint('DAO created successfully');

      // Initialize services
      debugPrint('Creating Supabase service...');
      _supabaseService = _supabaseServiceFactory.createService();
      debugPrint('Supabase service created successfully');

      // Initialize repository
      debugPrint('Creating Todo repository...');
      _todoRepository = _todoRepositoryFactory.createRepository(
        localDao: _todoDao!,
        remoteService: _supabaseService!,
        userId: widget.userId,
      );
      debugPrint('Todo repository created successfully');

      // Initialize BLoC with dependencies
      debugPrint('Creating TodoBloc...');
      _todoBloc = _todoBlocFactory.createBloc(_todoRepository!); // Updated
      debugPrint('TodoBloc created successfully');

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });

        // Load initial data
        debugPrint('Loading initial data...');
        _todoBloc!.add(LoadTodos());
      }
    } catch (e, stackTrace) {
      // Handle initialization error
      debugPrint('Initialization error: $e');
      debugPrint('Stack trace: $stackTrace');
      
      if (mounted) {
        setState(() {
          _initializationError = e.toString();
          _isInitialized = true; // Still set to true to show error state
        });
      }
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
                SizedBox(height: 8),
                Text(
                  'This may take a moment',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
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
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      debugPrint('User requested to see full error details');
                      // Show full error in a dialog or copy to clipboard
                    },
                    child: const Text('View Details'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (_todoBloc == null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                const Text('Failed to initialize application'),
                const SizedBox(height: 8),
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
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider.value(value: _todoBloc!, child: TodoScreen()),
    );
  }
}