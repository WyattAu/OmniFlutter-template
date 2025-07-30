part of 'todo_bloc.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = TodoStateInitial;
  const factory TodoState.loading() = TodoStateLoading;
  const factory TodoState.loaded({
    @Default([]) List<Todo> todos,
    @Default(Filter.all) Filter filter,
    @Default(false) bool isSyncing,
  }) = TodoStateLoaded;
  const factory TodoState.error(Failure failure) = TodoStateError;
}

enum Filter { all, active, completed }

extension TodoStateX on TodoStateLoaded {
  List<Todo> get filteredTodos {
    switch (filter) {
      case Filter.active:
        return todos.where((todo) => !todo.isCompleted).toList();
      case Filter.completed:
        return todos.where((todo) => todo.isCompleted).toList();
      default:
        return List.unmodifiable(todos);
    }
  }
}
