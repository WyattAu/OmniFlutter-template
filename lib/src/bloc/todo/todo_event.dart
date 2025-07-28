import 'package:equatable/equatable.dart';
import '../../models/todo.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;
  const AddTodo(this.todo);

  @override
  List<Object?> get props => [todo];
}

class UpdateTodo extends TodoEvent {
  final Todo todo;
  const UpdateTodo(this.todo);

  @override
  List<Object?> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final String todoId;
  const DeleteTodo(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

class ToggleTodoCompletion extends TodoEvent {
  final String todoId;
  final bool isCompleted;
  const ToggleTodoCompletion(this.todoId, this.isCompleted);

  @override
  List<Object?> get props => [todoId, isCompleted];
}
