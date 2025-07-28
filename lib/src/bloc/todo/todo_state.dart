import 'package:equatable/equatable.dart';
import '../../models/todo.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoLoading extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoLoaded extends TodoState {
  final List<Todo> todos;
  final List<Todo> filteredTodos;
  final Filter filter;

  TodoLoaded({required this.todos, required this.filter})
    : filteredTodos = _filterTodos(todos, filter);

  static List<Todo> _filterTodos(List<Todo> todos, Filter filter) {
    switch (filter) {
      case Filter.active:
        return todos.where((todo) => !todo.isCompleted).toList();
      case Filter.completed:
        return todos.where((todo) => todo.isCompleted).toList();
      default:
        return todos;
    }
  }

  TodoLoaded copyWith({List<Todo>? todos, Filter? filter}) {
    return TodoLoaded(
      todos: todos ?? this.todos,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [todos, filteredTodos, filter];
}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message);
  @override
  List<Object?> get props => [message];
}

enum Filter { all, active, completed }
