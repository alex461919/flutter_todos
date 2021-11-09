// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FulfilledTodoListBlocStateTearOff {
  const _$FulfilledTodoListBlocStateTearOff();

  _FulfilledTodoListBlocState call(Map<DateTime, List<TodoEntity>> map) {
    return _FulfilledTodoListBlocState(
      map,
    );
  }
}

/// @nodoc
const $FulfilledTodoListBlocState = _$FulfilledTodoListBlocStateTearOff();

/// @nodoc
mixin _$FulfilledTodoListBlocState {
  Map<DateTime, List<TodoEntity>> get map => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FulfilledTodoListBlocStateCopyWith<FulfilledTodoListBlocState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FulfilledTodoListBlocStateCopyWith<$Res> {
  factory $FulfilledTodoListBlocStateCopyWith(FulfilledTodoListBlocState value,
          $Res Function(FulfilledTodoListBlocState) then) =
      _$FulfilledTodoListBlocStateCopyWithImpl<$Res>;
  $Res call({Map<DateTime, List<TodoEntity>> map});
}

/// @nodoc
class _$FulfilledTodoListBlocStateCopyWithImpl<$Res>
    implements $FulfilledTodoListBlocStateCopyWith<$Res> {
  _$FulfilledTodoListBlocStateCopyWithImpl(this._value, this._then);

  final FulfilledTodoListBlocState _value;
  // ignore: unused_field
  final $Res Function(FulfilledTodoListBlocState) _then;

  @override
  $Res call({
    Object? map = freezed,
  }) {
    return _then(_value.copyWith(
      map: map == freezed
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<TodoEntity>>,
    ));
  }
}

/// @nodoc
abstract class _$FulfilledTodoListBlocStateCopyWith<$Res>
    implements $FulfilledTodoListBlocStateCopyWith<$Res> {
  factory _$FulfilledTodoListBlocStateCopyWith(
          _FulfilledTodoListBlocState value,
          $Res Function(_FulfilledTodoListBlocState) then) =
      __$FulfilledTodoListBlocStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<DateTime, List<TodoEntity>> map});
}

/// @nodoc
class __$FulfilledTodoListBlocStateCopyWithImpl<$Res>
    extends _$FulfilledTodoListBlocStateCopyWithImpl<$Res>
    implements _$FulfilledTodoListBlocStateCopyWith<$Res> {
  __$FulfilledTodoListBlocStateCopyWithImpl(_FulfilledTodoListBlocState _value,
      $Res Function(_FulfilledTodoListBlocState) _then)
      : super(_value, (v) => _then(v as _FulfilledTodoListBlocState));

  @override
  _FulfilledTodoListBlocState get _value =>
      super._value as _FulfilledTodoListBlocState;

  @override
  $Res call({
    Object? map = freezed,
  }) {
    return _then(_FulfilledTodoListBlocState(
      map == freezed
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<TodoEntity>>,
    ));
  }
}

/// @nodoc

class _$_FulfilledTodoListBlocState extends _FulfilledTodoListBlocState {
  const _$_FulfilledTodoListBlocState(this.map) : super._();

  @override
  final Map<DateTime, List<TodoEntity>> map;

  @override
  String toString() {
    return 'FulfilledTodoListBlocState(map: $map)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FulfilledTodoListBlocState &&
            const DeepCollectionEquality().equals(other.map, map));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(map));

  @JsonKey(ignore: true)
  @override
  _$FulfilledTodoListBlocStateCopyWith<_FulfilledTodoListBlocState>
      get copyWith => __$FulfilledTodoListBlocStateCopyWithImpl<
          _FulfilledTodoListBlocState>(this, _$identity);
}

abstract class _FulfilledTodoListBlocState extends FulfilledTodoListBlocState {
  const factory _FulfilledTodoListBlocState(
      Map<DateTime, List<TodoEntity>> map) = _$_FulfilledTodoListBlocState;
  const _FulfilledTodoListBlocState._() : super._();

  @override
  Map<DateTime, List<TodoEntity>> get map;
  @override
  @JsonKey(ignore: true)
  _$FulfilledTodoListBlocStateCopyWith<_FulfilledTodoListBlocState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$RejectedTodoListBlocStateTearOff {
  const _$RejectedTodoListBlocStateTearOff();

  _RejectedTodoListBlocState call(Exception exception) {
    return _RejectedTodoListBlocState(
      exception,
    );
  }
}

/// @nodoc
const $RejectedTodoListBlocState = _$RejectedTodoListBlocStateTearOff();

/// @nodoc
mixin _$RejectedTodoListBlocState {
  Exception get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RejectedTodoListBlocStateCopyWith<RejectedTodoListBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectedTodoListBlocStateCopyWith<$Res> {
  factory $RejectedTodoListBlocStateCopyWith(RejectedTodoListBlocState value,
          $Res Function(RejectedTodoListBlocState) then) =
      _$RejectedTodoListBlocStateCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

/// @nodoc
class _$RejectedTodoListBlocStateCopyWithImpl<$Res>
    implements $RejectedTodoListBlocStateCopyWith<$Res> {
  _$RejectedTodoListBlocStateCopyWithImpl(this._value, this._then);

  final RejectedTodoListBlocState _value;
  // ignore: unused_field
  final $Res Function(RejectedTodoListBlocState) _then;

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
abstract class _$RejectedTodoListBlocStateCopyWith<$Res>
    implements $RejectedTodoListBlocStateCopyWith<$Res> {
  factory _$RejectedTodoListBlocStateCopyWith(_RejectedTodoListBlocState value,
          $Res Function(_RejectedTodoListBlocState) then) =
      __$RejectedTodoListBlocStateCopyWithImpl<$Res>;
  @override
  $Res call({Exception exception});
}

/// @nodoc
class __$RejectedTodoListBlocStateCopyWithImpl<$Res>
    extends _$RejectedTodoListBlocStateCopyWithImpl<$Res>
    implements _$RejectedTodoListBlocStateCopyWith<$Res> {
  __$RejectedTodoListBlocStateCopyWithImpl(_RejectedTodoListBlocState _value,
      $Res Function(_RejectedTodoListBlocState) _then)
      : super(_value, (v) => _then(v as _RejectedTodoListBlocState));

  @override
  _RejectedTodoListBlocState get _value =>
      super._value as _RejectedTodoListBlocState;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_RejectedTodoListBlocState(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_RejectedTodoListBlocState extends _RejectedTodoListBlocState {
  const _$_RejectedTodoListBlocState(this.exception) : super._();

  @override
  final Exception exception;

  @override
  String toString() {
    return 'RejectedTodoListBlocState(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RejectedTodoListBlocState &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  _$RejectedTodoListBlocStateCopyWith<_RejectedTodoListBlocState>
      get copyWith =>
          __$RejectedTodoListBlocStateCopyWithImpl<_RejectedTodoListBlocState>(
              this, _$identity);
}

abstract class _RejectedTodoListBlocState extends RejectedTodoListBlocState {
  const factory _RejectedTodoListBlocState(Exception exception) =
      _$_RejectedTodoListBlocState;
  const _RejectedTodoListBlocState._() : super._();

  @override
  Exception get exception;
  @override
  @JsonKey(ignore: true)
  _$RejectedTodoListBlocStateCopyWith<_RejectedTodoListBlocState>
      get copyWith => throw _privateConstructorUsedError;
}
