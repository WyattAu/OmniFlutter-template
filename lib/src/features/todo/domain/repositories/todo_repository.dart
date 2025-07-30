import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Stream<Either<Failure, List<Todo>>> watchAllTodos();
  Future<Either<Failure, List<Todo>>> getAllTodos();
  Future<Either<Failure, Todo>> addTodo(Todo todo);
  Future<Either<Failure, Todo>> updateTodo(Todo todo);
  Future<Either<Failure, Unit>> deleteTodo(String id);
  Future<Either<Failure, Unit>> syncTodos();
}
