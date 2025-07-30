import 'package:flutter_test/flutter_test.dart';
import 'package:omniflutter_template/src/features/todo/domain/entities/todo.dart';

void main() {
  group('Todo', () {
    final dateTime = DateTime(2023, 1, 1);
    final todo = Todo(
      id: '1',
      title: 'Test Todo',
      description: 'Test Description',
      isCompleted: false,
      createdAt: dateTime,
      updatedAt: dateTime,
    );

    test('should create a Todo instance correctly', () {
      // Assert
      expect(todo.id, equals('1'));
      expect(todo.title, equals('Test Todo'));
      expect(todo.description, equals('Test Description'));
      expect(todo.isCompleted, isFalse);
      expect(todo.createdAt, equals(dateTime));
      expect(todo.updatedAt, equals(dateTime));
    });

    test('should create a copy with changed properties using copyWith', () {
      // Act
      final updatedTodo = todo.copyWith(
        title: 'Updated Todo',
        isCompleted: true,
      );

      // Assert
      expect(updatedTodo.id, equals(todo.id));
      expect(updatedTodo.title, equals('Updated Todo'));
      expect(updatedTodo.description, equals(todo.description));
      expect(updatedTodo.isCompleted, isTrue);
      expect(updatedTodo.createdAt, equals(todo.createdAt));
    });

    test('should compare equality correctly', () {
      // Arrange
      final todo2 = Todo(
        id: '1',
        title: 'Test Todo',
        description: 'Test Description',
        isCompleted: false,
        createdAt: dateTime,
        updatedAt: dateTime,
      );

      // Assert
      expect(todo, equals(todo2));
    });

    test('should have correct props for equality comparison', () {
      // Act
      final props = todo.props;

      // Assert
      expect(props, contains('1'));
      expect(props, contains('Test Todo'));
      expect(props, contains('Test Description'));
      expect(props, contains(false));
      expect(props, contains(dateTime));
    });
  });
}
