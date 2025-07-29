import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:omniflutter_template/src/app.dart';
import 'package:omniflutter_template/src/di/mock_container.dart';
import 'package:omniflutter_template/src/bloc/todo/todo_event.dart';
import 'package:omniflutter_template/src/bloc/todo/todo_state.dart';
import 'package:omniflutter_template/src/ui/screens/todo_screen.dart';

void main() {
  late MockSupabaseManager mockSupabaseManager;
  late MockDatabaseFactory mockDatabaseFactory;
  late MockTodoDaoFactory mockTodoDaoFactory;
  late MockSupabaseServiceFactory mockSupabaseServiceFactory;
  late MockTodoBlocFactory mockTodoBlocFactory;
  late MockAppDatabase mockDatabase;
  late MockTodoDao mockTodoDao;
  late MockSupabaseService mockSupabaseService;
  late MockTodoBloc mockTodoBloc;
  late MockSupabaseClient mockSupabaseClient;

  setUpAll(() {
    registerFallbackValue(LoadTodos());
    registerFallbackValue(TodoLoading());
  });

  setUp(() {
    mockSupabaseManager = MockSupabaseManager();
    mockDatabaseFactory = MockDatabaseFactory();
    mockTodoDaoFactory = MockTodoDaoFactory();
    mockSupabaseServiceFactory = MockSupabaseServiceFactory();
    mockTodoBlocFactory = MockTodoBlocFactory();
    mockDatabase = MockAppDatabase();
    mockTodoDao = MockTodoDao();
    mockSupabaseService = MockSupabaseService();
    mockTodoBloc = MockTodoBloc();
    mockSupabaseClient = MockSupabaseClient();

    // Default successful initialization behavior
    when(() => mockSupabaseManager.initialize()).thenAnswer((_) async {});
    when(() => mockSupabaseManager.isInitialized).thenReturn(true);
    when(() => mockSupabaseManager.client).thenReturn(mockSupabaseClient);

    when(() => mockDatabaseFactory.createDatabase()).thenReturn(mockDatabase);
    when(() => mockTodoDaoFactory.createDao(any())).thenReturn(mockTodoDao);
    when(
      () => mockSupabaseServiceFactory.createService(),
    ).thenReturn(mockSupabaseService);
    when(
      () => mockTodoBlocFactory.createBloc(
        localDao: any(named: 'localDao'),
        remoteService: any(named: 'remoteService'),
        userId: any(named: 'userId'),
      ),
    ).thenReturn(mockTodoBloc);
  });

  group('TodoApp', () {
    testWidgets('shows loading indicator during initialization', (
      WidgetTester tester,
    ) async {
      // Make initialization take some time
      when(
        () => mockSupabaseManager.initialize(),
      ).thenAnswer((_) => Future.delayed(const Duration(milliseconds: 100)));

      await tester.pumpWidget(
        TodoApp(
          supabaseManager: mockSupabaseManager,
          databaseFactory: mockDatabaseFactory,
          todoDaoFactory: mockTodoDaoFactory,
          supabaseServiceFactory: mockSupabaseServiceFactory,
          todoBlocFactory: mockTodoBlocFactory,
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Initializing...'), findsOneWidget);

      // Wait for initialization to complete
      await tester.pumpAndSettle();
    });

    testWidgets('shows TodoScreen after successful initialization', (
      WidgetTester tester,
    ) async {
      when(() => mockTodoBloc.state).thenReturn(TodoLoading());

      await tester.pumpWidget(
        TodoApp(
          supabaseManager: mockSupabaseManager,
          databaseFactory: mockDatabaseFactory,
          todoDaoFactory: mockTodoDaoFactory,
          supabaseServiceFactory: mockSupabaseServiceFactory,
          todoBlocFactory: mockTodoBlocFactory,
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(TodoScreen), findsOneWidget);
    });

    testWidgets('shows error screen when initialization fails', (
      WidgetTester tester,
    ) async {
      when(
        () => mockSupabaseManager.initialize(),
      ).thenThrow(Exception('Network error'));

      await tester.pumpWidget(
        TodoApp(
          supabaseManager: mockSupabaseManager,
          databaseFactory: mockDatabaseFactory,
          todoDaoFactory: mockTodoDaoFactory,
          supabaseServiceFactory: mockSupabaseServiceFactory,
          todoBlocFactory: mockTodoBlocFactory,
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Failed to initialize application'), findsOneWidget);
      expect(find.text('Exception: Network error'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget); // Retry button
    });

    testWidgets('retry button works after initialization failure', (
      WidgetTester tester,
    ) async {
      // Track call count to simulate different behavior on retry
      int callCount = 0;

      when(() => mockSupabaseManager.initialize()).thenAnswer((_) async {
        callCount++;
        if (callCount == 1) {
          throw Exception('First error');
        }
        // Second call succeeds (no exception)
      });

      await tester.pumpWidget(
        TodoApp(
          supabaseManager: mockSupabaseManager,
          databaseFactory: mockDatabaseFactory,
          todoDaoFactory: mockTodoDaoFactory,
          supabaseServiceFactory: mockSupabaseServiceFactory,
          todoBlocFactory: mockTodoBlocFactory,
        ),
      );

      await tester.pumpAndSettle();

      // Verify error state
      expect(find.text('Failed to initialize application'), findsOneWidget);

      // Reset call count for the retry
      callCount = 0;
      // Re-setup the mock for successful retry
      when(() => mockSupabaseManager.initialize()).thenAnswer((_) async {});

      // Tap retry button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Verify loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      // Verify success state
      expect(find.byType(TodoScreen), findsOneWidget);
    });

    testWidgets('loads todos after initialization', (
      WidgetTester tester,
    ) async {
      when(() => mockTodoBloc.state).thenReturn(TodoLoading());

      await tester.pumpWidget(
        TodoApp(
          supabaseManager: mockSupabaseManager,
          databaseFactory: mockDatabaseFactory,
          todoDaoFactory: mockTodoDaoFactory,
          supabaseServiceFactory: mockSupabaseServiceFactory,
          todoBlocFactory: mockTodoBlocFactory,
        ),
      );

      await tester.pumpAndSettle();

      // Verify that LoadTodos event was added
      verify(() => mockTodoBloc.add(any(that: isA<LoadTodos>()))).called(1);
    });
  });

  group('TodoApp - Production Mode', () {
    testWidgets('uses production dependencies by default', (
      WidgetTester tester,
    ) async {
      // This test ensures the app can be instantiated without mocks
      await tester.pumpWidget(const TodoApp());

      // Should show loading initially
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
