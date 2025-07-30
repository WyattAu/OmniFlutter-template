import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@Freezed(equal: true, copyWith: true)
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    String? description,
    required bool isCompleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? userId,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
