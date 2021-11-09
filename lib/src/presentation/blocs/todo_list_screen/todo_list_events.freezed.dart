// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_list_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewTodoListBlocEventTearOff {
  const _$NewTodoListBlocEventTearOff();

  _NewTodoListBlocEvent call(List<TodoEntity> list) {
    return _NewTodoListBlocEvent(
      list,
    );
  }
}

/// @nodoc
const $NewTodoListBlocEvent = _$NewTodoListBlocEventTearOff();

/// @nodoc
mixin _$NewTodoListBlocEvent {
  List<TodoEntity> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewTodoListBlocEventCopyWith<NewTodoListBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTodoListBlocEventCopyWith<$Res> {
  factory $NewTodoListBlocEventCopyWith(NewTodoListBlocEvent value,
          $Res Function(NewTodoListBlocEvent) then) =
      _$NewTodoListBlocEventCopyWithImpl<$Res>;
  $Res call({List<TodoEntity> list});
}

/// @nodoc
class _$NewTodoListBlocEventCopyWithImpl<$Res>
    implements $NewTodoListBlocEventCopyWith<$Res> {
  _$NewTodoListBlocEventCopyWithImpl(this._value, this._then);

  final NewTodoListBlocEvent _value;
  // ignore: unused_field
  final $Res Function(NewTodoListBlocEvent) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TodoEntity>,
    ));
  }
}

/// @nodoc
abstract class _$NewTodoListBlocEventCopyWith<$Res>
    implements $NewTodoListBlocEventCopyWith<$Res> {
  factory _$NewTodoListBlocEventCopyWith(_NewTodoListBlocEvent value,
          $Res Function(_NewTodoListBlocEvent) then) =
      __$NewTodoListBlocEventCopyWithImpl<$Res>;
  @override
  $Res call({List<TodoEntity> list});
}

/// @nodoc
class __$NewTodoListBlocEventCopyWithImpl<$Res>
    extends _$NewTodoListBlocEventCopyWithImpl<$Res>
    implements _$NewTodoListBlocEventCopyWith<$Res> {
  __$NewTodoListBlocEventCopyWithImpl(
      _NewTodoListBlocEvent _value, $Res Function(_NewTodoListBlocEvent) _then)
      : super(_value, (v) => _then(v as _NewTodoListBlocEvent));

  @override
  _NewTodoListBlocEvent get _value => super._value as _NewTodoListBlocEvent;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_NewTodoListBlocEvent(
      list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TodoEntity>,
    ));
  }
}

/// @nodoc

class _$_NewTodoListBlocEvent extends _NewTodoListBlocEvent {
  const _$_NewTodoListBlocEvent(this.list) : super._();

  @override
  final List<TodoEntity> list;

  @override
  String toString() {
    return 'NewTodoListBlocEvent(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewTodoListBlocEvent &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$NewTodoListBlocEventCopyWith<_NewTodoListBlocEvent> get copyWith =>
      __$NewTodoListBlocEventCopyWithImpl<_NewTodoListBlocEvent>(
          this, _$identity);
}

abstract class _NewTodoListBlocEvent extends NewTodoListBlocEvent {
  const factory _NewTodoListBlocEvent(List<TodoEntity> list) =
      _$_NewTodoListBlocEvent;
  const _NewTodoListBlocEvent._() : super._();

  @override
  List<TodoEntity> get list;
  @override
  @JsonKey(ignore: true)
  _$NewTodoListBlocEventCopyWith<_NewTodoListBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ErrorTodoListBlocEventTearOff {
  const _$ErrorTodoListBlocEventTearOff();

  _ErrorTodoListBlocEvent call(Exception exception) {
    return _ErrorTodoListBlocEvent(
      exception,
    );
  }
}

/// @nodoc
const $ErrorTodoListBlocEvent = _$ErrorTodoListBlocEventTearOff();

/// @nodoc
mixin _$ErrorTodoListBlocEvent {
  Exception get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ErrorTodoListBlocEventCopyWith<ErrorTodoListBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorTodoListBlocEventCopyWith<$Res> {
  factory $ErrorTodoListBlocEventCopyWith(ErrorTodoListBlocEvent value,
          $Res Function(ErrorTodoListBlocEvent) then) =
      _$ErrorTodoListBlocEventCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

/// @nodoc
class _$ErrorTodoListBlocEventCopyWithImpl<$Res>
    implements $ErrorTodoListBlocEventCopyWith<$Res> {
  _$ErrorTodoListBlocEventCopyWithImpl(this._value, this._then);

  final ErrorTodoListBlocEvent _value;
  // ignore: unused_field
  final $Res Function(ErrorTodoListBlocEvent) _then;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc
abstract class _$ErrorTodoListBlocEventCopyWith<$Res>
    implements $ErrorTodoListBlocEventCopyWith<$Res> {
  factory _$ErrorTodoListBlocEventCopyWith(_ErrorTodoListBlocEvent value,
          $Res Function(_ErrorTodoListBlocEvent) then) =
      __$ErrorTodoListBlocEventCopyWithImpl<$Res>;
  @override
  $Res call({Exception exception});
}

/// @nodoc
class __$ErrorTodoListBlocEventCopyWithImpl<$Res>
    extends _$ErrorTodoListBlocEventCopyWithImpl<$Res>
    implements _$ErrorTodoListBlocEventCopyWith<$Res> {
  __$ErrorTodoListBlocEventCopyWithImpl(_ErrorTodoListBlocEvent _value,
      $Res Function(_ErrorTodoListBlocEvent) _then)
      : super(_value, (v) => _then(v as _ErrorTodoListBlocEvent));

  @override
  _ErrorTodoListBlocEvent get _value => super._value as _ErrorTodoListBlocEvent;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_ErrorTodoListBlocEvent(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_ErrorTodoListBlocEvent extends _ErrorTodoListBlocEvent {
  const _$_ErrorTodoListBlocEvent(this.exception) : super._();

  @override
  final Exception exception;

  @override
  String toString() {
    return 'ErrorTodoListBlocEvent(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrorTodoListBlocEvent &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  _$ErrorTodoListBlocEventCopyWith<_ErrorTodoListBlocEvent> get copyWith =>
      __$ErrorTodoListBlocEventCopyWithImpl<_ErrorTodoListBlocEvent>(
          this, _$identity);
}

abstract class _ErrorTodoListBlocEvent extends ErrorTodoListBlocEvent {
  const factory _ErrorTodoListBlocEvent(Exception exception) =
      _$_ErrorTodoListBlocEvent;
  const _ErrorTodoListBlocEvent._() : super._();

  @override
  Exception get exception;
  @override
  @JsonKey(ignore: true)
  _$ErrorTodoListBlocEventCopyWith<_ErrorTodoListBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
