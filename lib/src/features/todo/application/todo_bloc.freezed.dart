// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TodoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTodos,
    required TResult Function(Todo todo) addTodo,
    required TResult Function(Todo todo) updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String todoId, bool isCompleted)
    toggleTodoCompletion,
    required TResult Function() syncTodos,
    required TResult Function(Filter filter) filterTodos,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTodos,
    TResult? Function(Todo todo)? addTodo,
    TResult? Function(Todo todo)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult? Function()? syncTodos,
    TResult? Function(Filter filter)? filterTodos,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTodos,
    TResult Function(Todo todo)? addTodo,
    TResult Function(Todo todo)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult Function()? syncTodos,
    TResult Function(Filter filter)? filterTodos,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodos value) loadTodos,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(UpdateTodo value) updateTodo,
    required TResult Function(DeleteTodo value) deleteTodo,
    required TResult Function(ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(SyncTodos value) syncTodos,
    required TResult Function(FilterTodos value) filterTodos,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodos value)? loadTodos,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(UpdateTodo value)? updateTodo,
    TResult? Function(DeleteTodo value)? deleteTodo,
    TResult? Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(SyncTodos value)? syncTodos,
    TResult? Function(FilterTodos value)? filterTodos,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodos value)? loadTodos,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(UpdateTodo value)? updateTodo,
    TResult Function(DeleteTodo value)? deleteTodo,
    TResult Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(SyncTodos value)? syncTodos,
    TResult Function(FilterTodos value)? filterTodos,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoEventCopyWith<$Res> {
  factory $TodoEventCopyWith(TodoEvent value, $Res Function(TodoEvent) then) =
      _$TodoEventCopyWithImpl<$Res, TodoEvent>;
}

/// @nodoc
class _$TodoEventCopyWithImpl<$Res, $Val extends TodoEvent>
    implements $TodoEventCopyWith<$Res> {
  _$TodoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadTodosImplCopyWith<$Res> {
  factory _$$LoadTodosImplCopyWith(
    _$LoadTodosImpl value,
    $Res Function(_$LoadTodosImpl) then,
  ) = __$$LoadTodosImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadTodosImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$LoadTodosImpl>
    implements _$$LoadTodosImplCopyWith<$Res> {
  __$$LoadTodosImplCopyWithImpl(
    _$LoadTodosImpl _value,
    $Res Function(_$LoadTodosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadTodosImpl implements LoadTodos {
  const _$LoadTodosImpl();

  @override
  String toString() {
    return 'TodoEvent.loadTodos()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadTodosImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTodos,
    required TResult Function(Todo todo) addTodo,
    required TResult Function(Todo todo) updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String todoId, bool isCompleted)
    toggleTodoCompletion,
    required TResult Function() syncTodos,
    required TResult Function(Filter filter) filterTodos,
  }) {
    return loadTodos();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTodos,
    TResult? Function(Todo todo)? addTodo,
    TResult? Function(Todo todo)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult? Function()? syncTodos,
    TResult? Function(Filter filter)? filterTodos,
  }) {
    return loadTodos?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTodos,
    TResult Function(Todo todo)? addTodo,
    TResult Function(Todo todo)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult Function()? syncTodos,
    TResult Function(Filter filter)? filterTodos,
    required TResult orElse(),
  }) {
    if (loadTodos != null) {
      return loadTodos();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodos value) loadTodos,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(UpdateTodo value) updateTodo,
    required TResult Function(DeleteTodo value) deleteTodo,
    required TResult Function(ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(SyncTodos value) syncTodos,
    required TResult Function(FilterTodos value) filterTodos,
  }) {
    return loadTodos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodos value)? loadTodos,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(UpdateTodo value)? updateTodo,
    TResult? Function(DeleteTodo value)? deleteTodo,
    TResult? Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(SyncTodos value)? syncTodos,
    TResult? Function(FilterTodos value)? filterTodos,
  }) {
    return loadTodos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodos value)? loadTodos,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(UpdateTodo value)? updateTodo,
    TResult Function(DeleteTodo value)? deleteTodo,
    TResult Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(SyncTodos value)? syncTodos,
    TResult Function(FilterTodos value)? filterTodos,
    required TResult orElse(),
  }) {
    if (loadTodos != null) {
      return loadTodos(this);
    }
    return orElse();
  }
}

abstract class LoadTodos implements TodoEvent {
  const factory LoadTodos() = _$LoadTodosImpl;
}

/// @nodoc
abstract class _$$AddTodoImplCopyWith<$Res> {
  factory _$$AddTodoImplCopyWith(
    _$AddTodoImpl value,
    $Res Function(_$AddTodoImpl) then,
  ) = __$$AddTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Todo todo});

  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class __$$AddTodoImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$AddTodoImpl>
    implements _$$AddTodoImplCopyWith<$Res> {
  __$$AddTodoImplCopyWithImpl(
    _$AddTodoImpl _value,
    $Res Function(_$AddTodoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todo = null}) {
    return _then(
      _$AddTodoImpl(
        null == todo
            ? _value.todo
            : todo // ignore: cast_nullable_to_non_nullable
                  as Todo,
      ),
    );
  }

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodoCopyWith<$Res> get todo {
    return $TodoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$AddTodoImpl implements AddTodo {
  const _$AddTodoImpl(this.todo);

  @override
  final Todo todo;

  @override
  String toString() {
    return 'TodoEvent.addTodo(todo: $todo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTodoImpl &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTodoImplCopyWith<_$AddTodoImpl> get copyWith =>
      __$$AddTodoImplCopyWithImpl<_$AddTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTodos,
    required TResult Function(Todo todo) addTodo,
    required TResult Function(Todo todo) updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String todoId, bool isCompleted)
    toggleTodoCompletion,
    required TResult Function() syncTodos,
    required TResult Function(Filter filter) filterTodos,
  }) {
    return addTodo(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTodos,
    TResult? Function(Todo todo)? addTodo,
    TResult? Function(Todo todo)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult? Function()? syncTodos,
    TResult? Function(Filter filter)? filterTodos,
  }) {
    return addTodo?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTodos,
    TResult Function(Todo todo)? addTodo,
    TResult Function(Todo todo)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult Function()? syncTodos,
    TResult Function(Filter filter)? filterTodos,
    required TResult orElse(),
  }) {
    if (addTodo != null) {
      return addTodo(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodos value) loadTodos,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(UpdateTodo value) updateTodo,
    required TResult Function(DeleteTodo value) deleteTodo,
    required TResult Function(ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(SyncTodos value) syncTodos,
    required TResult Function(FilterTodos value) filterTodos,
  }) {
    return addTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodos value)? loadTodos,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(UpdateTodo value)? updateTodo,
    TResult? Function(DeleteTodo value)? deleteTodo,
    TResult? Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(SyncTodos value)? syncTodos,
    TResult? Function(FilterTodos value)? filterTodos,
  }) {
    return addTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodos value)? loadTodos,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(UpdateTodo value)? updateTodo,
    TResult Function(DeleteTodo value)? deleteTodo,
    TResult Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(SyncTodos value)? syncTodos,
    TResult Function(FilterTodos value)? filterTodos,
    required TResult orElse(),
  }) {
    if (addTodo != null) {
      return addTodo(this);
    }
    return orElse();
  }
}

abstract class AddTodo implements TodoEvent {
  const factory AddTodo(final Todo todo) = _$AddTodoImpl;

  Todo get todo;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTodoImplCopyWith<_$AddTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTodoImplCopyWith<$Res> {
  factory _$$UpdateTodoImplCopyWith(
    _$UpdateTodoImpl value,
    $Res Function(_$UpdateTodoImpl) then,
  ) = __$$UpdateTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Todo todo});

  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class __$$UpdateTodoImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$UpdateTodoImpl>
    implements _$$UpdateTodoImplCopyWith<$Res> {
  __$$UpdateTodoImplCopyWithImpl(
    _$UpdateTodoImpl _value,
    $Res Function(_$UpdateTodoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todo = null}) {
    return _then(
      _$UpdateTodoImpl(
        null == todo
            ? _value.todo
            : todo // ignore: cast_nullable_to_non_nullable
                  as Todo,
      ),
    );
  }

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodoCopyWith<$Res> get todo {
    return $TodoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$UpdateTodoImpl implements UpdateTodo {
  const _$UpdateTodoImpl(this.todo);

  @override
  final Todo todo;

  @override
  String toString() {
    return 'TodoEvent.updateTodo(todo: $todo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTodoImpl &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTodoImplCopyWith<_$UpdateTodoImpl> get copyWith =>
      __$$UpdateTodoImplCopyWithImpl<_$UpdateTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTodos,
    required TResult Function(Todo todo) addTodo,
    required TResult Function(Todo todo) updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String todoId, bool isCompleted)
    toggleTodoCompletion,
    required TResult Function() syncTodos,
    required TResult Function(Filter filter) filterTodos,
  }) {
    return updateTodo(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTodos,
    TResult? Function(Todo todo)? addTodo,
    TResult? Function(Todo todo)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult? Function()? syncTodos,
    TResult? Function(Filter filter)? filterTodos,
  }) {
    return updateTodo?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTodos,
    TResult Function(Todo todo)? addTodo,
    TResult Function(Todo todo)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult Function()? syncTodos,
    TResult Function(Filter filter)? filterTodos,
    required TResult orElse(),
  }) {
    if (updateTodo != null) {
      return updateTodo(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodos value) loadTodos,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(UpdateTodo value) updateTodo,
    required TResult Function(DeleteTodo value) deleteTodo,
    required TResult Function(ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(SyncTodos value) syncTodos,
    required TResult Function(FilterTodos value) filterTodos,
  }) {
    return updateTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodos value)? loadTodos,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(UpdateTodo value)? updateTodo,
    TResult? Function(DeleteTodo value)? deleteTodo,
    TResult? Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(SyncTodos value)? syncTodos,
    TResult? Function(FilterTodos value)? filterTodos,
  }) {
    return updateTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodos value)? loadTodos,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(UpdateTodo value)? updateTodo,
    TResult Function(DeleteTodo value)? deleteTodo,
    TResult Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(SyncTodos value)? syncTodos,
    TResult Function(FilterTodos value)? filterTodos,
    required TResult orElse(),
  }) {
    if (updateTodo != null) {
      return updateTodo(this);
    }
    return orElse();
  }
}

abstract class UpdateTodo implements TodoEvent {
  const factory UpdateTodo(final Todo todo) = _$UpdateTodoImpl;

  Todo get todo;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTodoImplCopyWith<_$UpdateTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTodoImplCopyWith<$Res> {
  factory _$$DeleteTodoImplCopyWith(
    _$DeleteTodoImpl value,
    $Res Function(_$DeleteTodoImpl) then,
  ) = __$$DeleteTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId});
}

/// @nodoc
class __$$DeleteTodoImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$DeleteTodoImpl>
    implements _$$DeleteTodoImplCopyWith<$Res> {
  __$$DeleteTodoImplCopyWithImpl(
    _$DeleteTodoImpl _value,
    $Res Function(_$DeleteTodoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null}) {
    return _then(
      _$DeleteTodoImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteTodoImpl implements DeleteTodo {
  const _$DeleteTodoImpl(this.todoId);

  @override
  final String todoId;

  @override
  String toString() {
    return 'TodoEvent.deleteTodo(todoId: $todoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTodoImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTodoImplCopyWith<_$DeleteTodoImpl> get copyWith =>
      __$$DeleteTodoImplCopyWithImpl<_$DeleteTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTodos,
    required TResult Function(Todo todo) addTodo,
    required TResult Function(Todo todo) updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String todoId, bool isCompleted)
    toggleTodoCompletion,
    required TResult Function() syncTodos,
    required TResult Function(Filter filter) filterTodos,
  }) {
    return deleteTodo(todoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTodos,
    TResult? Function(Todo todo)? addTodo,
    TResult? Function(Todo todo)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult? Function()? syncTodos,
    TResult? Function(Filter filter)? filterTodos,
  }) {
    return deleteTodo?.call(todoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTodos,
    TResult Function(Todo todo)? addTodo,
    TResult Function(Todo todo)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult Function()? syncTodos,
    TResult Function(Filter filter)? filterTodos,
    required TResult orElse(),
  }) {
    if (deleteTodo != null) {
      return deleteTodo(todoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodos value) loadTodos,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(UpdateTodo value) updateTodo,
    required TResult Function(DeleteTodo value) deleteTodo,
    required TResult Function(ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(SyncTodos value) syncTodos,
    required TResult Function(FilterTodos value) filterTodos,
  }) {
    return deleteTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodos value)? loadTodos,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(UpdateTodo value)? updateTodo,
    TResult? Function(DeleteTodo value)? deleteTodo,
    TResult? Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(SyncTodos value)? syncTodos,
    TResult? Function(FilterTodos value)? filterTodos,
  }) {
    return deleteTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodos value)? loadTodos,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(UpdateTodo value)? updateTodo,
    TResult Function(DeleteTodo value)? deleteTodo,
    TResult Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(SyncTodos value)? syncTodos,
    TResult Function(FilterTodos value)? filterTodos,
    required TResult orElse(),
  }) {
    if (deleteTodo != null) {
      return deleteTodo(this);
    }
    return orElse();
  }
}

abstract class DeleteTodo implements TodoEvent {
  const factory DeleteTodo(final String todoId) = _$DeleteTodoImpl;

  String get todoId;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteTodoImplCopyWith<_$DeleteTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleTodoCompletionImplCopyWith<$Res> {
  factory _$$ToggleTodoCompletionImplCopyWith(
    _$ToggleTodoCompletionImpl value,
    $Res Function(_$ToggleTodoCompletionImpl) then,
  ) = __$$ToggleTodoCompletionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId, bool isCompleted});
}

/// @nodoc
class __$$ToggleTodoCompletionImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$ToggleTodoCompletionImpl>
    implements _$$ToggleTodoCompletionImplCopyWith<$Res> {
  __$$ToggleTodoCompletionImplCopyWithImpl(
    _$ToggleTodoCompletionImpl _value,
    $Res Function(_$ToggleTodoCompletionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null, Object? isCompleted = null}) {
    return _then(
      _$ToggleTodoCompletionImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ToggleTodoCompletionImpl implements ToggleTodoCompletion {
  const _$ToggleTodoCompletionImpl(this.todoId, this.isCompleted);

  @override
  final String todoId;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'TodoEvent.toggleTodoCompletion(todoId: $todoId, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleTodoCompletionImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId, isCompleted);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleTodoCompletionImplCopyWith<_$ToggleTodoCompletionImpl>
  get copyWith =>
      __$$ToggleTodoCompletionImplCopyWithImpl<_$ToggleTodoCompletionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTodos,
    required TResult Function(Todo todo) addTodo,
    required TResult Function(Todo todo) updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String todoId, bool isCompleted)
    toggleTodoCompletion,
    required TResult Function() syncTodos,
    required TResult Function(Filter filter) filterTodos,
  }) {
    return toggleTodoCompletion(todoId, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTodos,
    TResult? Function(Todo todo)? addTodo,
    TResult? Function(Todo todo)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult? Function()? syncTodos,
    TResult? Function(Filter filter)? filterTodos,
  }) {
    return toggleTodoCompletion?.call(todoId, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTodos,
    TResult Function(Todo todo)? addTodo,
    TResult Function(Todo todo)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult Function()? syncTodos,
    TResult Function(Filter filter)? filterTodos,
    required TResult orElse(),
  }) {
    if (toggleTodoCompletion != null) {
      return toggleTodoCompletion(todoId, isCompleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodos value) loadTodos,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(UpdateTodo value) updateTodo,
    required TResult Function(DeleteTodo value) deleteTodo,
    required TResult Function(ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(SyncTodos value) syncTodos,
    required TResult Function(FilterTodos value) filterTodos,
  }) {
    return toggleTodoCompletion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodos value)? loadTodos,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(UpdateTodo value)? updateTodo,
    TResult? Function(DeleteTodo value)? deleteTodo,
    TResult? Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(SyncTodos value)? syncTodos,
    TResult? Function(FilterTodos value)? filterTodos,
  }) {
    return toggleTodoCompletion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodos value)? loadTodos,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(UpdateTodo value)? updateTodo,
    TResult Function(DeleteTodo value)? deleteTodo,
    TResult Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(SyncTodos value)? syncTodos,
    TResult Function(FilterTodos value)? filterTodos,
    required TResult orElse(),
  }) {
    if (toggleTodoCompletion != null) {
      return toggleTodoCompletion(this);
    }
    return orElse();
  }
}

abstract class ToggleTodoCompletion implements TodoEvent {
  const factory ToggleTodoCompletion(
    final String todoId,
    final bool isCompleted,
  ) = _$ToggleTodoCompletionImpl;

  String get todoId;
  bool get isCompleted;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleTodoCompletionImplCopyWith<_$ToggleTodoCompletionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncTodosImplCopyWith<$Res> {
  factory _$$SyncTodosImplCopyWith(
    _$SyncTodosImpl value,
    $Res Function(_$SyncTodosImpl) then,
  ) = __$$SyncTodosImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncTodosImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$SyncTodosImpl>
    implements _$$SyncTodosImplCopyWith<$Res> {
  __$$SyncTodosImplCopyWithImpl(
    _$SyncTodosImpl _value,
    $Res Function(_$SyncTodosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SyncTodosImpl implements SyncTodos {
  const _$SyncTodosImpl();

  @override
  String toString() {
    return 'TodoEvent.syncTodos()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncTodosImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTodos,
    required TResult Function(Todo todo) addTodo,
    required TResult Function(Todo todo) updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String todoId, bool isCompleted)
    toggleTodoCompletion,
    required TResult Function() syncTodos,
    required TResult Function(Filter filter) filterTodos,
  }) {
    return syncTodos();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTodos,
    TResult? Function(Todo todo)? addTodo,
    TResult? Function(Todo todo)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult? Function()? syncTodos,
    TResult? Function(Filter filter)? filterTodos,
  }) {
    return syncTodos?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTodos,
    TResult Function(Todo todo)? addTodo,
    TResult Function(Todo todo)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult Function()? syncTodos,
    TResult Function(Filter filter)? filterTodos,
    required TResult orElse(),
  }) {
    if (syncTodos != null) {
      return syncTodos();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodos value) loadTodos,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(UpdateTodo value) updateTodo,
    required TResult Function(DeleteTodo value) deleteTodo,
    required TResult Function(ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(SyncTodos value) syncTodos,
    required TResult Function(FilterTodos value) filterTodos,
  }) {
    return syncTodos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodos value)? loadTodos,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(UpdateTodo value)? updateTodo,
    TResult? Function(DeleteTodo value)? deleteTodo,
    TResult? Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(SyncTodos value)? syncTodos,
    TResult? Function(FilterTodos value)? filterTodos,
  }) {
    return syncTodos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodos value)? loadTodos,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(UpdateTodo value)? updateTodo,
    TResult Function(DeleteTodo value)? deleteTodo,
    TResult Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(SyncTodos value)? syncTodos,
    TResult Function(FilterTodos value)? filterTodos,
    required TResult orElse(),
  }) {
    if (syncTodos != null) {
      return syncTodos(this);
    }
    return orElse();
  }
}

abstract class SyncTodos implements TodoEvent {
  const factory SyncTodos() = _$SyncTodosImpl;
}

/// @nodoc
abstract class _$$FilterTodosImplCopyWith<$Res> {
  factory _$$FilterTodosImplCopyWith(
    _$FilterTodosImpl value,
    $Res Function(_$FilterTodosImpl) then,
  ) = __$$FilterTodosImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Filter filter});
}

/// @nodoc
class __$$FilterTodosImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$FilterTodosImpl>
    implements _$$FilterTodosImplCopyWith<$Res> {
  __$$FilterTodosImplCopyWithImpl(
    _$FilterTodosImpl _value,
    $Res Function(_$FilterTodosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filter = null}) {
    return _then(
      _$FilterTodosImpl(
        null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as Filter,
      ),
    );
  }
}

/// @nodoc

class _$FilterTodosImpl implements FilterTodos {
  const _$FilterTodosImpl(this.filter);

  @override
  final Filter filter;

  @override
  String toString() {
    return 'TodoEvent.filterTodos(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterTodosImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterTodosImplCopyWith<_$FilterTodosImpl> get copyWith =>
      __$$FilterTodosImplCopyWithImpl<_$FilterTodosImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTodos,
    required TResult Function(Todo todo) addTodo,
    required TResult Function(Todo todo) updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String todoId, bool isCompleted)
    toggleTodoCompletion,
    required TResult Function() syncTodos,
    required TResult Function(Filter filter) filterTodos,
  }) {
    return filterTodos(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTodos,
    TResult? Function(Todo todo)? addTodo,
    TResult? Function(Todo todo)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult? Function()? syncTodos,
    TResult? Function(Filter filter)? filterTodos,
  }) {
    return filterTodos?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTodos,
    TResult Function(Todo todo)? addTodo,
    TResult Function(Todo todo)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String todoId, bool isCompleted)? toggleTodoCompletion,
    TResult Function()? syncTodos,
    TResult Function(Filter filter)? filterTodos,
    required TResult orElse(),
  }) {
    if (filterTodos != null) {
      return filterTodos(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodos value) loadTodos,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(UpdateTodo value) updateTodo,
    required TResult Function(DeleteTodo value) deleteTodo,
    required TResult Function(ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(SyncTodos value) syncTodos,
    required TResult Function(FilterTodos value) filterTodos,
  }) {
    return filterTodos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodos value)? loadTodos,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(UpdateTodo value)? updateTodo,
    TResult? Function(DeleteTodo value)? deleteTodo,
    TResult? Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(SyncTodos value)? syncTodos,
    TResult? Function(FilterTodos value)? filterTodos,
  }) {
    return filterTodos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodos value)? loadTodos,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(UpdateTodo value)? updateTodo,
    TResult Function(DeleteTodo value)? deleteTodo,
    TResult Function(ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(SyncTodos value)? syncTodos,
    TResult Function(FilterTodos value)? filterTodos,
    required TResult orElse(),
  }) {
    if (filterTodos != null) {
      return filterTodos(this);
    }
    return orElse();
  }
}

abstract class FilterTodos implements TodoEvent {
  const factory FilterTodos(final Filter filter) = _$FilterTodosImpl;

  Filter get filter;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterTodosImplCopyWith<_$FilterTodosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TodoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Todo> todos, Filter filter, bool isSyncing)
    loaded,
    required TResult Function(Failure failure) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Todo> todos, Filter filter, bool isSyncing)? loaded,
    TResult? Function(Failure failure)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Todo> todos, Filter filter, bool isSyncing)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoStateInitial value) initial,
    required TResult Function(TodoStateLoading value) loading,
    required TResult Function(TodoStateLoaded value) loaded,
    required TResult Function(TodoStateError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoStateInitial value)? initial,
    TResult? Function(TodoStateLoading value)? loading,
    TResult? Function(TodoStateLoaded value)? loaded,
    TResult? Function(TodoStateError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoStateInitial value)? initial,
    TResult Function(TodoStateLoading value)? loading,
    TResult Function(TodoStateLoaded value)? loaded,
    TResult Function(TodoStateError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TodoStateInitialImplCopyWith<$Res> {
  factory _$$TodoStateInitialImplCopyWith(
    _$TodoStateInitialImpl value,
    $Res Function(_$TodoStateInitialImpl) then,
  ) = __$$TodoStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoStateInitialImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateInitialImpl>
    implements _$$TodoStateInitialImplCopyWith<$Res> {
  __$$TodoStateInitialImplCopyWithImpl(
    _$TodoStateInitialImpl _value,
    $Res Function(_$TodoStateInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TodoStateInitialImpl implements TodoStateInitial {
  const _$TodoStateInitialImpl();

  @override
  String toString() {
    return 'TodoState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Todo> todos, Filter filter, bool isSyncing)
    loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Todo> todos, Filter filter, bool isSyncing)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Todo> todos, Filter filter, bool isSyncing)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoStateInitial value) initial,
    required TResult Function(TodoStateLoading value) loading,
    required TResult Function(TodoStateLoaded value) loaded,
    required TResult Function(TodoStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoStateInitial value)? initial,
    TResult? Function(TodoStateLoading value)? loading,
    TResult? Function(TodoStateLoaded value)? loaded,
    TResult? Function(TodoStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoStateInitial value)? initial,
    TResult Function(TodoStateLoading value)? loading,
    TResult Function(TodoStateLoaded value)? loaded,
    TResult Function(TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TodoStateInitial implements TodoState {
  const factory TodoStateInitial() = _$TodoStateInitialImpl;
}

/// @nodoc
abstract class _$$TodoStateLoadingImplCopyWith<$Res> {
  factory _$$TodoStateLoadingImplCopyWith(
    _$TodoStateLoadingImpl value,
    $Res Function(_$TodoStateLoadingImpl) then,
  ) = __$$TodoStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoStateLoadingImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateLoadingImpl>
    implements _$$TodoStateLoadingImplCopyWith<$Res> {
  __$$TodoStateLoadingImplCopyWithImpl(
    _$TodoStateLoadingImpl _value,
    $Res Function(_$TodoStateLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TodoStateLoadingImpl implements TodoStateLoading {
  const _$TodoStateLoadingImpl();

  @override
  String toString() {
    return 'TodoState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Todo> todos, Filter filter, bool isSyncing)
    loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Todo> todos, Filter filter, bool isSyncing)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Todo> todos, Filter filter, bool isSyncing)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoStateInitial value) initial,
    required TResult Function(TodoStateLoading value) loading,
    required TResult Function(TodoStateLoaded value) loaded,
    required TResult Function(TodoStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoStateInitial value)? initial,
    TResult? Function(TodoStateLoading value)? loading,
    TResult? Function(TodoStateLoaded value)? loaded,
    TResult? Function(TodoStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoStateInitial value)? initial,
    TResult Function(TodoStateLoading value)? loading,
    TResult Function(TodoStateLoaded value)? loaded,
    TResult Function(TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TodoStateLoading implements TodoState {
  const factory TodoStateLoading() = _$TodoStateLoadingImpl;
}

/// @nodoc
abstract class _$$TodoStateLoadedImplCopyWith<$Res> {
  factory _$$TodoStateLoadedImplCopyWith(
    _$TodoStateLoadedImpl value,
    $Res Function(_$TodoStateLoadedImpl) then,
  ) = __$$TodoStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Todo> todos, Filter filter, bool isSyncing});
}

/// @nodoc
class __$$TodoStateLoadedImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateLoadedImpl>
    implements _$$TodoStateLoadedImplCopyWith<$Res> {
  __$$TodoStateLoadedImplCopyWithImpl(
    _$TodoStateLoadedImpl _value,
    $Res Function(_$TodoStateLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? filter = null,
    Object? isSyncing = null,
  }) {
    return _then(
      _$TodoStateLoadedImpl(
        todos: null == todos
            ? _value._todos
            : todos // ignore: cast_nullable_to_non_nullable
                  as List<Todo>,
        filter: null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as Filter,
        isSyncing: null == isSyncing
            ? _value.isSyncing
            : isSyncing // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$TodoStateLoadedImpl implements TodoStateLoaded {
  const _$TodoStateLoadedImpl({
    final List<Todo> todos = const [],
    this.filter = Filter.all,
    this.isSyncing = false,
  }) : _todos = todos;

  final List<Todo> _todos;
  @override
  @JsonKey()
  List<Todo> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  @JsonKey()
  final Filter filter;
  @override
  @JsonKey()
  final bool isSyncing;

  @override
  String toString() {
    return 'TodoState.loaded(todos: $todos, filter: $filter, isSyncing: $isSyncing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.isSyncing, isSyncing) ||
                other.isSyncing == isSyncing));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_todos),
    filter,
    isSyncing,
  );

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoStateLoadedImplCopyWith<_$TodoStateLoadedImpl> get copyWith =>
      __$$TodoStateLoadedImplCopyWithImpl<_$TodoStateLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Todo> todos, Filter filter, bool isSyncing)
    loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(todos, filter, isSyncing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Todo> todos, Filter filter, bool isSyncing)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(todos, filter, isSyncing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Todo> todos, Filter filter, bool isSyncing)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(todos, filter, isSyncing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoStateInitial value) initial,
    required TResult Function(TodoStateLoading value) loading,
    required TResult Function(TodoStateLoaded value) loaded,
    required TResult Function(TodoStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoStateInitial value)? initial,
    TResult? Function(TodoStateLoading value)? loading,
    TResult? Function(TodoStateLoaded value)? loaded,
    TResult? Function(TodoStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoStateInitial value)? initial,
    TResult Function(TodoStateLoading value)? loading,
    TResult Function(TodoStateLoaded value)? loaded,
    TResult Function(TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TodoStateLoaded implements TodoState {
  const factory TodoStateLoaded({
    final List<Todo> todos,
    final Filter filter,
    final bool isSyncing,
  }) = _$TodoStateLoadedImpl;

  List<Todo> get todos;
  Filter get filter;
  bool get isSyncing;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoStateLoadedImplCopyWith<_$TodoStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodoStateErrorImplCopyWith<$Res> {
  factory _$$TodoStateErrorImplCopyWith(
    _$TodoStateErrorImpl value,
    $Res Function(_$TodoStateErrorImpl) then,
  ) = __$$TodoStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$TodoStateErrorImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateErrorImpl>
    implements _$$TodoStateErrorImplCopyWith<$Res> {
  __$$TodoStateErrorImplCopyWithImpl(
    _$TodoStateErrorImpl _value,
    $Res Function(_$TodoStateErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? failure = null}) {
    return _then(
      _$TodoStateErrorImpl(
        null == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as Failure,
      ),
    );
  }

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$TodoStateErrorImpl implements TodoStateError {
  const _$TodoStateErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'TodoState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoStateErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoStateErrorImplCopyWith<_$TodoStateErrorImpl> get copyWith =>
      __$$TodoStateErrorImplCopyWithImpl<_$TodoStateErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Todo> todos, Filter filter, bool isSyncing)
    loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Todo> todos, Filter filter, bool isSyncing)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Todo> todos, Filter filter, bool isSyncing)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoStateInitial value) initial,
    required TResult Function(TodoStateLoading value) loading,
    required TResult Function(TodoStateLoaded value) loaded,
    required TResult Function(TodoStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoStateInitial value)? initial,
    TResult? Function(TodoStateLoading value)? loading,
    TResult? Function(TodoStateLoaded value)? loaded,
    TResult? Function(TodoStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoStateInitial value)? initial,
    TResult Function(TodoStateLoading value)? loading,
    TResult Function(TodoStateLoaded value)? loaded,
    TResult Function(TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TodoStateError implements TodoState {
  const factory TodoStateError(final Failure failure) = _$TodoStateErrorImpl;

  Failure get failure;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoStateErrorImplCopyWith<_$TodoStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
