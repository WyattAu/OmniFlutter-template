import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:omniflutter_template/src/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:omniflutter_template/src/features/todo/domain/entities/todo.dart';
import 'package:omniflutter_template/src/core/error/failure.dart';

// Mock classes
class MockTodoDao extends Mock implements TodoDao {}

class MockSupabaseService extends Mock implements SupabaseService {}

void main() {
  late TodoRepositoryImpl repository;
  late MockTodoDao mockDao;
  late MockSupabaseService mockSupabase;

  const testUserId = 'test-user-id';

  setUp(() {
    mockDao = MockTodoDao();
    mockSupabase = MockSupabaseService();
    repository = TodoRepositoryImpl(
      localDao: mockDao,
      remoteService: mockSupabase,
      userId: testUserId,
    );
  });

  group('TodoRepositoryImpl', () {
    final testTodo = Todo(
      id: '1',
      title: 'Test Todo',
      description: 'Test Description',
      isCompleted: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final testTodos = [testTodo];

    group('getAllTodos', () {
      test('should return remote todos when sync is successful', () async {
        // Arrange
        when(() => mockDao.getAllTodos()).thenAnswer((_) async => testTodos);
        when(
          () => mockSupabase.getAllTodos(testUserId),
        ).thenAnswer((_) async => Right(testTodos));
        when(() => mockDao.clearTodos()).thenAnswer((_) async => 0);
        when(() => mockDao.insertTodos(any())).thenAnswer((_) async => 1);

        // Act
        final result = await repository.getAllTodos();

        // Assert
        expect(result, equals(Right(testTodos)));
        verify(() => mockDao.getAllTodos()).called(1);
        verify(() => mockSupabase.getAllTodos(testUserId)).called(1);
        verify(() => mockDao.clearTodos()).called(1);
        verify(() => mockDao.insertTodos(testTodos)).called(1);
      });

      test('should return local todos when remote sync fails', () async {
        // Arrange
        when(() => mockDao.getAllTodos()).thenAnswer((_) async => testTodos);
        when(
          () => mockSupabase.getAllTodos(testUserId),
        ).thenAnswer((_) async => const Left(ServerFailure('Network error')));

        // Act
        final result = await repository.getAllTodos();

        // Assert
        expect(result, equals(Right(testTodos)));
        verify(() => mockDao.getAllTodos()).called(2); // Initial + fallback
        verify(() => mockSupabase.getAllTodos(testUserId)).called(1);
      });

      test('should return failure when both local and remote fail', () async {
        // Arrange
        when(
          () => mockDao.getAllTodos(),
        ).thenAnswer((_) async => throw Exception('Database error'));
        when(
          () => mockSupabase.getAllTodos(testUserId),
        ).thenAnswer((_) async => const Left(ServerFailure('Network error')));

        // Act
        final result = await repository.getAllTodos();

        // Assert
        expect(result, isA<Left<Failure, dynamic>>());
        verify(() => mockDao.getAllTodos()).called(1);
        verifyNever(() => mockSupabase.getAllTodos(testUserId));
      });
    });

    group('addTodo', () {
      test(
        'should add todo to both local and remote when successful',
        () async {
          // Arrange
          when(() => mockDao.insertTodo(testTodo)).thenAnswer((_) async => 1);
          when(
            () => mockSupabase.createTodo(testTodo),
          ).thenAnswer((_) async => const Right(true));

          // Act
          final result = await repository.addTodo(testTodo);

          // Assert
          expect(result, equals(const Right(testTodo)));
          verify(() => mockDao.insertTodo(testTodo)).called(1);
          verify(() => mockSupabase.createTodo(testTodo)).called(1);
        },
      );

      test('should return failure when remote creation fails', () async {
        // Arrange
        when(() => mockDao.insertTodo(testTodo)).thenAnswer((_) async => 1);
        when(
          () => mockSupabase.createTodo(testTodo),
        ).thenAnswer((_) async => const Left(ServerFailure('Server error')));

        // Act
        final result = await repository.addTodo(testTodo);

        // Assert
        expect(result, isA<Left<Failure, dynamic>>());
        verify(() => mockDao.insertTodo(testTodo)).called(1);
        verify(() => mockSupabase.createTodo(testTodo)).called(1);
      });

      test('should return failure when local insertion fails', () async {
        // Arrange
        when(
          () => mockDao.insertTodo(testTodo),
        ).thenThrow(Exception('Database error'));

        // Act
        final result = await repository.addTodo(testTodo);

        // Assert
        expect(result, isA<Left<Failure, dynamic>>());
        verify(() => mockDao.insertTodo(testTodo)).called(1);
        verifyNever(() => mockSupabase.createTodo(testTodo));
      });
    });

    group('updateTodo', () {
      test(
        'should update todo in both local and remote when successful',
        () async {
          // Arrange
          final updatedTodo = testTodo.copyWith(isCompleted: true);
          when(
            () => mockDao.updateTodo(updatedTodo),
          ).thenAnswer((_) async => 1);
          when(
            () => mockSupabase.updateTodo(updatedTodo),
          ).thenAnswer((_) async => const Right(true));

          // Act
          final result = await repository.updateTodo(updatedTodo);

          // Assert
          expect(result, equals(const Right(updatedTodo)));
          verify(() => mockDao.updateTodo(updatedTodo)).called(1);
          verify(() => mockSupabase.updateTodo(updatedTodo)).called(1);
        },
      );

      test('should return failure when remote update fails', () async {
        // Arrange
        final updatedTodo = testTodo.copyWith(isCompleted: true);
        when(() => mockDao.updateTodo(updatedTodo)).thenAnswer((_) async => 1);
        when(
          () => mockSupabase.updateTodo(updatedTodo),
        ).thenAnswer((_) async => const Left(ServerFailure('Server error')));

        // Act
        final result = await repository.updateTodo(updatedTodo);

        // Assert
        expect(result, isA<Left<Failure, dynamic>>());
        verify(() => mockDao.updateTodo(updatedTodo)).called(1);
        verify(() => mockSupabase.updateTodo(updatedTodo)).called(1);
      });
    });

    group('deleteTodo', () {
      test(
        'should delete todo from both local and remote when successful',
        () async {
          // Arrange
          const todoId = '1';
          when(() => mockDao.deleteTodo(todoId)).thenAnswer((_) async => 1);
          when(
            () => mockSupabase.deleteTodo(todoId),
          ).thenAnswer((_) async => const Right(true));

          // Act
          final result = await repository.deleteTodo(todoId);

          // Assert
          expect(result, equals(const Right(true)));
          verify(() => mockDao.deleteTodo(todoId)).called(1);
          verify(() => mockSupabase.deleteTodo(todoId)).called(1);
        },
      );

      test('should return failure when remote deletion fails', () async {
        // Arrange
        const todoId = '1';
        when(() => mockDao.deleteTodo(todoId)).thenAnswer((_) async => 1);
        when(
          () => mockSupabase.deleteTodo(todoId),
        ).thenAnswer((_) async => const Left(ServerFailure('Server error')));

        // Act
        final result = await repository.deleteTodo(todoId);

        // Assert
        expect(result, isA<Left<Failure, dynamic>>());
        verify(() => mockDao.deleteTodo(todoId)).called(1);
        verify(() => mockSupabase.deleteTodo(todoId)).called(1);
      });
    });

    group('syncTodos', () {
      test('should sync todos successfully', () async {
        // Arrange
        when(() => mockDao.getAllTodos()).thenAnswer((_) async => testTodos);
        when(
          () => mockSupabase.getAllTodos(testUserId),
        ).thenAnswer((_) async => Right(testTodos));
        when(() => mockDao.clearTodos()).thenAnswer((_) async => 0);
        when(() => mockDao.insertTodos(any())).thenAnswer((_) async => 1);

        // Act
        final result = await repository.syncTodos();

        // Assert
        expect(result, equals(const Right(true)));
        verify(() => mockDao.getAllTodos()).called(1);
        verify(() => mockSupabase.getAllTodos(testUserId)).called(1);
        verify(() => mockDao.clearTodos()).called(1);
        verify(() => mockDao.insertTodos(testTodos)).called(1);
      });

      test('should return failure when sync fails', () async {
        // Arrange
        when(
          () => mockDao.getAllTodos(),
        ).thenAnswer((_) async => throw Exception('DB error'));

        // Act
        final result = await repository.syncTodos();

        // Assert
        expect(result, isA<Left<Failure, dynamic>>());
        verify(() => mockDao.getAllTodos()).called(1);
        verifyNever(() => mockSupabase.getAllTodos(testUserId));
      });
    });
  });
}
