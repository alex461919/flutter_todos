// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delete_todo_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeleteTodoUseCaseParamsTearOff {
  const _$DeleteTodoUseCaseParamsTearOff();

  _DeleteTodoUseCaseParams call(TodoEntity todo) {
    return _DeleteTodoUseCaseParams(
      todo,
    );
  }
}

/// @nodoc
const $DeleteTodoUseCaseParams = _$DeleteTodoUseCaseParamsTearOff();

/// @nodoc
mixin _$DeleteTodoUseCaseParams {
  TodoEntity get todo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteTodoUseCaseParamsCopyWith<DeleteTodoUseCaseParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteTodoUseCaseParamsCopyWith<$Res> {
  factory $DeleteTodoUseCaseParamsCopyWith(DeleteTodoUseCaseParams value,
          $Res Function(DeleteTodoUseCaseParams) then) =
      _$DeleteTodoUseCaseParamsCopyWithImpl<$Res>;
  $Res call({TodoEntity todo});

  $TodoEntityCopyWith<$Res> get todo;
}

/// @nodoc
class _$DeleteTodoUseCaseParamsCopyWithImpl<$Res>
    implements $DeleteTodoUseCaseParamsCopyWith<$Res> {
  _$DeleteTodoUseCaseParamsCopyWithImpl(this._value, this._then);

  final DeleteTodoUseCaseParams _value;
  // ignore: unused_field
  final $Res Function(DeleteTodoUseCaseParams) _then;

  @override
  $Res call({
    Object? todo = freezed,
  }) {
    return _then(_value.copyWith(
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoEntity,
    ));
  }

  @override
  $TodoEntityCopyWith<$Res> get todo {
    return $TodoEntityCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc
abstract class _$DeleteTodoUseCaseParamsCopyWith<$Res>
    implements $DeleteTodoUseCaseParamsCopyWith<$Res> {
  factory _$DeleteTodoUseCaseParamsCopyWith(_DeleteTodoUseCaseParams value,
          $Res Function(_DeleteTodoUseCaseParams) then) =
      __$DeleteTodoUseCaseParamsCopyWithImpl<$Res>;
  @override
  $Res call({TodoEntity todo});

  @override
  $TodoEntityCopyWith<$Res> get todo;
}

/// @nodoc
class __$DeleteTodoUseCaseParamsCopyWithImpl<$Res>
    extends _$DeleteTodoUseCaseParamsCopyWithImpl<$Res>
    implements _$DeleteTodoUseCaseParamsCopyWith<$Res> {
  __$DeleteTodoUseCaseParamsCopyWithImpl(_DeleteTodoUseCaseParams _value,
      $Res Function(_DeleteTodoUseCaseParams) _then)
      : super(_value, (v) => _then(v as _DeleteTodoUseCaseParams));

  @override
  _DeleteTodoUseCaseParams get _value =>
      super._value as _DeleteTodoUseCaseParams;

  @override
  $Res call({
    Object? todo = freezed,
  }) {
    return _then(_DeleteTodoUseCaseParams(
      todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoEntity,
    ));
  }
}

/// @nodoc

class _$_DeleteTodoUseCaseParams implements _DeleteTodoUseCaseParams {
  const _$_DeleteTodoUseCaseParams(this.todo);

  @override
  final TodoEntity todo;

  @override
  String toString() {
    return 'DeleteTodoUseCaseParams(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteTodoUseCaseParams &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  _$DeleteTodoUseCaseParamsCopyWith<_DeleteTodoUseCaseParams> get copyWith =>
      __$DeleteTodoUseCaseParamsCopyWithImpl<_DeleteTodoUseCaseParams>(
          this, _$identity);
}

abstract class _DeleteTodoUseCaseParams implements DeleteTodoUseCaseParams {
  const factory _DeleteTodoUseCaseParams(TodoEntity todo) =
      _$_DeleteTodoUseCaseParams;

  @override
  TodoEntity get todo;
  @override
  @JsonKey(ignore: true)
  _$DeleteTodoUseCaseParamsCopyWith<_DeleteTodoUseCaseParams> get copyWith =>
      throw _privateConstructorUsedError;
}
