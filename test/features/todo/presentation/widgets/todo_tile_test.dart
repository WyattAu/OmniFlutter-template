import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omniflutter_template/src/features/todo/domain/entities/todo.dart';
import 'package:omniflutter_template/src/features/todo/application/todo_bloc.dart';
import 'package:omniflutter_template/src/features/todo/presentation/widgets/todo_tile.dart';

class MockTodoBloc extends Mock implements TodoBloc {}

void main() {
  group('TodoTile', () {
    final testTodo = Todo(
      id: '1',
      title: 'Test Todo',
      description: 'Test Description',
      isCompleted: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    late MockTodoBloc mockBloc;

    setUp(() {
      mockBloc = MockTodoBloc();
    });

    testWidgets('should display todo title and description', (tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(const TodoState.initial());
      whenListen(
        mockBloc,
        Stream.value(const TodoState.initial()),
        initialState: const TodoState.initial(),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<TodoBloc>.value(
              value: mockBloc,
              child: TodoTile(todo: testTodo),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(testTodo.title), findsOneWidget);
      expect(find.text(testTodo.description!), findsOneWidget);
    });

    testWidgets('should toggle completion when checkbox is tapped', (
      tester,
    ) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(const TodoState.initial());
      whenListen(
        mockBloc,
        Stream.value(const TodoState.initial()),
        initialState: const TodoState.initial(),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<TodoBloc>.value(
              value: mockBloc,
              child: TodoTile(todo: testTodo),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      // Assert
      verify(
        () => mockBloc.add(TodoEvent.toggleTodoCompletion(testTodo.id, true)),
      ).called(1);
    });

    testWidgets('should show completed style when todo is completed', (
      tester,
    ) async {
      // Arrange
      final completedTodo = testTodo.copyWith(isCompleted: true);
      when(() => mockBloc.state).thenReturn(const TodoState.initial());
      whenListen(
        mockBloc,
        Stream.value(const TodoState.initial()),
        initialState: const TodoState.initial(),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<TodoBloc>.value(
              value: mockBloc,
              child: TodoTile(todo: completedTodo),
            ),
          ),
        ),
      );

      // Assert
      final titleFinder = find.text(completedTodo.title);
      final titleWidget = tester.widget<Text>(titleFinder);
      expect(titleWidget.style?.decoration, equals(TextDecoration.lineThrough));
    });
  });
}
