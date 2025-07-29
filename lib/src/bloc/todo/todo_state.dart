import 'package:equatable/equatable.dart';
import '../../domain/entities/todo.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoLoading extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoLoaded extends TodoState {
  final List<Todo> todos;
  final Filter filter;
  final bool isSyncing;

  TodoLoaded({
    required this.todos,
    required this.filter,
    this.isSyncing = false,
  });

  // Lazily compute filteredTodos
  List<Todo> get filteredTodos {
    switch (filter) {
      case Filter.active:
        return todos.where((t) => !t.isCompleted).toList();
      case Filter.completed:
        return todos.where((t) => t.isCompleted).toList();
      default:
        return todos;
    }
  }

  TodoLoaded copyWith({
    List<Todo>? todos,
    Filter? filter,
    bool? isSyncing,
  }) {
    return TodoLoaded(
      todos: todos ?? this.todos,
      filter: filter ?? this.filter,
      isSyncing: isSyncing ?? this.isSyncing,
    );
  }

  @override
  List<Object?> get props => [todos, filter, isSyncing];
}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message);
  
  @override
  List<Object?> get props => [message];
}

enum Filter { all, active, completed }