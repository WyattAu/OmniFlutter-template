import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:omniflutter_template/src/features/todo/application/todo_bloc.dart';
import 'package:omniflutter_template/src/features/todo/domain/entities/todo.dart';
import 'package:omniflutter_template/src/core/error/failure.dart';

// Mock repository
class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late TodoBloc bloc;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    bloc = TodoBloc(mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('TodoBloc', () {
    final testTodo = Todo(
      id: '1',
      title: 'Test Todo',
      description: 'Test Description',
      isCompleted: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final testTodos = [testTodo];

    test('initial state should be TodoState.initial()', () {
      // Assert
      expect(bloc.state, equals(const TodoState.initial()));
    });

    group('LoadTodos', () {
      test(
        'should emit [loading, loaded] when data is loaded successfully',
        () async {
          // Arrange
          when(
            () => mockRepository.getAllTodos(),
          ).thenAnswer((_) async => Right(testTodos));

          // Act
          bloc.add(const TodoEvent.loadTodos());

          // Assert
          await expectLater(
            bloc.stream,
            emitsInOrder([
              const TodoState.loading(),
              TodoState.loaded(todos: testTodos),
            ]),
          );
        },
      );

      test('should emit [loading, error] when data loading fails', () async {
        // Arrange
        final failure = ServerFailure('Server error');
        when(
          () => mockRepository.getAllTodos(),
        ).thenAnswer((_) async => Left(failure));

        // Act
        bloc.add(const TodoEvent.loadTodos());

        // Assert
        await expectLater(
          bloc.stream,
          emitsInOrder([const TodoState.loading(), TodoState.error(failure)]),
        );
      });
    });

    group('AddTodo', () {
      test(
        'should emit [loaded] with new todo when add is successful',
        () async {
          // Arrange
          when(
            () => mockRepository.addTodo(testTodo),
          ).thenAnswer((_) async => const Right(testTodo));

          // First load todos
          bloc.emit(TodoState.loaded(todos: []));

          // Act
          bloc.add(TodoEvent.addTodo(testTodo));

          // Assert
          await expectLater(
            bloc.stream,
            emits(
              predicate<TodoState>(
                (state) =>
                    state is TodoStateLoaded &&
                    state.todos.length == 1 &&
                    state.todos.first.id == testTodo.id,
              ),
            ),
          );
        },
      );

      test('should emit [error] when add fails', () async {
        // Arrange
        final failure = ServerFailure('Add failed');
        when(
          () => mockRepository.addTodo(testTodo),
        ).thenAnswer((_) async => Left(failure));

        bloc.emit(TodoState.loaded(todos: []));

        // Act
        bloc.add(TodoEvent.addTodo(testTodo));

        // Assert
        await expectLater(bloc.stream, emits(TodoState.error(failure)));
      });
    });

    group('UpdateTodo', () {
      test('should emit [loaded] with updated todo', () async {
        // Arrange
        final updatedTodo = testTodo.copyWith(isCompleted: true);
        when(
          () => mockRepository.updateTodo(updatedTodo),
        ).thenAnswer((_) async => const Right(updatedTodo));

        bloc.emit(TodoState.loaded(todos: [testTodo]));

        // Act
        bloc.add(TodoEvent.updateTodo(updatedTodo));

        // Assert
        await expectLater(
          bloc.stream,
          emits(
            predicate<TodoState>(
              (state) =>
                  state is TodoStateLoaded &&
                  state.todos.first.isCompleted == true,
            ),
          ),
        );
      });
    });

    group('DeleteTodo', () {
      test('should emit [loaded] without deleted todo', () async {
        // Arrange
        when(
          () => mockRepository.deleteTodo(testTodo.id),
        ).thenAnswer((_) async => const Right(true));

        bloc.emit(TodoState.loaded(todos: [testTodo]));

        // Act
        bloc.add(TodoEvent.deleteTodo(testTodo.id));

        // Assert
        await expectLater(
          bloc.stream,
          emits(
            predicate<TodoState>(
              (state) => state is TodoStateLoaded && state.todos.isEmpty,
            ),
          ),
        );
      });
    });

    group('ToggleTodoCompletion', () {
      test(
        'should emit [loaded] with toggled todo completion status',
        () async {
          // Arrange
          bloc.emit(TodoState.loaded(todos: [testTodo]));

          // Act
          bloc.add(const TodoEvent.toggleTodoCompletion('1', true));

          // Assert
          await expectLater(
            bloc.stream,
            emits(
              predicate<TodoState>(
                (state) =>
                    state is TodoStateLoaded &&
                    state.todos.first.isCompleted == true,
              ),
            ),
          );
        },
      );
    });

    group('FilterTodos', () {
      test('should emit [loaded] with updated filter', () async {
        // Arrange
        bloc.emit(TodoState.loaded(todos: [testTodo]));

        // Act
        bloc.add(const TodoEvent.filterTodos(Filter.completed));

        // Assert
        await expectLater(
          bloc.stream,
          emits(
            predicate<TodoState>(
              (state) =>
                  state is TodoStateLoaded && state.filter == Filter.completed,
            ),
          ),
        );
      });
    });
  });
}
