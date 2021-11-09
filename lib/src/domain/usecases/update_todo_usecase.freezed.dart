// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_todo_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UpdateTodoUseCaseParamsTearOff {
  const _$UpdateTodoUseCaseParamsTearOff();

  _UpdateTodoUseCaseParams call(TodoEntity todo) {
    return _UpdateTodoUseCaseParams(
      todo,
    );
  }
}

/// @nodoc
const $UpdateTodoUseCaseParams = _$UpdateTodoUseCaseParamsTearOff();

/// @nodoc
mixin _$UpdateTodoUseCaseParams {
  TodoEntity get todo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateTodoUseCaseParamsCopyWith<UpdateTodoUseCaseParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTodoUseCaseParamsCopyWith<$Res> {
  factory $UpdateTodoUseCaseParamsCopyWith(UpdateTodoUseCaseParams value,
          $Res Function(UpdateTodoUseCaseParams) then) =
      _$UpdateTodoUseCaseParamsCopyWithImpl<$Res>;
  $Res call({TodoEntity todo});

  $TodoEntityCopyWith<$Res> get todo;
}

/// @nodoc
class _$UpdateTodoUseCaseParamsCopyWithImpl<$Res>
    implements $UpdateTodoUseCaseParamsCopyWith<$Res> {
  _$UpdateTodoUseCaseParamsCopyWithImpl(this._value, this._then);

  final UpdateTodoUseCaseParams _value;
  // ignore: unused_field
  final $Res Function(UpdateTodoUseCaseParams) _then;

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
abstract class _$UpdateTodoUseCaseParamsCopyWith<$Res>
    implements $UpdateTodoUseCaseParamsCopyWith<$Res> {
  factory _$UpdateTodoUseCaseParamsCopyWith(_UpdateTodoUseCaseParams value,
          $Res Function(_UpdateTodoUseCaseParams) then) =
      __$UpdateTodoUseCaseParamsCopyWithImpl<$Res>;
  @override
  $Res call({TodoEntity todo});

  @override
  $TodoEntityCopyWith<$Res> get todo;
}

/// @nodoc
class __$UpdateTodoUseCaseParamsCopyWithImpl<$Res>
    extends _$UpdateTodoUseCaseParamsCopyWithImpl<$Res>
    implements _$UpdateTodoUseCaseParamsCopyWith<$Res> {
  __$UpdateTodoUseCaseParamsCopyWithImpl(_UpdateTodoUseCaseParams _value,
      $Res Function(_UpdateTodoUseCaseParams) _then)
      : super(_value, (v) => _then(v as _UpdateTodoUseCaseParams));

  @override
  _UpdateTodoUseCaseParams get _value =>
      super._value as _UpdateTodoUseCaseParams;

  @override
  $Res call({
    Object? todo = freezed,
  }) {
    return _then(_UpdateTodoUseCaseParams(
      todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoEntity,
    ));
  }
}

/// @nodoc

class _$_UpdateTodoUseCaseParams implements _UpdateTodoUseCaseParams {
  const _$_UpdateTodoUseCaseParams(this.todo);

  @override
  final TodoEntity todo;

  @override
  String toString() {
    return 'UpdateTodoUseCaseParams(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTodoUseCaseParams &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  _$UpdateTodoUseCaseParamsCopyWith<_UpdateTodoUseCaseParams> get copyWith =>
      __$UpdateTodoUseCaseParamsCopyWithImpl<_UpdateTodoUseCaseParams>(
          this, _$identity);
}

abstract class _UpdateTodoUseCaseParams implements UpdateTodoUseCaseParams {
  const factory _UpdateTodoUseCaseParams(TodoEntity todo) =
      _$_UpdateTodoUseCaseParams;

  @override
  TodoEntity get todo;
  @override
  @JsonKey(ignore: true)
  _$UpdateTodoUseCaseParamsCopyWith<_UpdateTodoUseCaseParams> get copyWith =>
      throw _privateConstructorUsedError;
}
