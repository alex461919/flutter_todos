// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'date_range_bloc_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SetDateRangeBlocEventTearOff {
  const _$SetDateRangeBlocEventTearOff();

  _SetDateRangeBlocEvent call(DateRangeEnum activeRangeEnum) {
    return _SetDateRangeBlocEvent(
      activeRangeEnum,
    );
  }
}

/// @nodoc
const $SetDateRangeBlocEvent = _$SetDateRangeBlocEventTearOff();

/// @nodoc
mixin _$SetDateRangeBlocEvent {
  DateRangeEnum get activeRangeEnum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SetDateRangeBlocEventCopyWith<SetDateRangeBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetDateRangeBlocEventCopyWith<$Res> {
  factory $SetDateRangeBlocEventCopyWith(SetDateRangeBlocEvent value,
          $Res Function(SetDateRangeBlocEvent) then) =
      _$SetDateRangeBlocEventCopyWithImpl<$Res>;
  $Res call({DateRangeEnum activeRangeEnum});
}

/// @nodoc
class _$SetDateRangeBlocEventCopyWithImpl<$Res>
    implements $SetDateRangeBlocEventCopyWith<$Res> {
  _$SetDateRangeBlocEventCopyWithImpl(this._value, this._then);

  final SetDateRangeBlocEvent _value;
  // ignore: unused_field
  final $Res Function(SetDateRangeBlocEvent) _then;

  @override
  $Res call({
    Object? activeRangeEnum = freezed,
  }) {
    return _then(_value.copyWith(
      activeRangeEnum: activeRangeEnum == freezed
          ? _value.activeRangeEnum
          : activeRangeEnum // ignore: cast_nullable_to_non_nullable
              as DateRangeEnum,
    ));
  }
}

/// @nodoc
abstract class _$SetDateRangeBlocEventCopyWith<$Res>
    implements $SetDateRangeBlocEventCopyWith<$Res> {
  factory _$SetDateRangeBlocEventCopyWith(_SetDateRangeBlocEvent value,
          $Res Function(_SetDateRangeBlocEvent) then) =
      __$SetDateRangeBlocEventCopyWithImpl<$Res>;
  @override
  $Res call({DateRangeEnum activeRangeEnum});
}

/// @nodoc
class __$SetDateRangeBlocEventCopyWithImpl<$Res>
    extends _$SetDateRangeBlocEventCopyWithImpl<$Res>
    implements _$SetDateRangeBlocEventCopyWith<$Res> {
  __$SetDateRangeBlocEventCopyWithImpl(_SetDateRangeBlocEvent _value,
      $Res Function(_SetDateRangeBlocEvent) _then)
      : super(_value, (v) => _then(v as _SetDateRangeBlocEvent));

  @override
  _SetDateRangeBlocEvent get _value => super._value as _SetDateRangeBlocEvent;

  @override
  $Res call({
    Object? activeRangeEnum = freezed,
  }) {
    return _then(_SetDateRangeBlocEvent(
      activeRangeEnum == freezed
          ? _value.activeRangeEnum
          : activeRangeEnum // ignore: cast_nullable_to_non_nullable
              as DateRangeEnum,
    ));
  }
}

/// @nodoc

class _$_SetDateRangeBlocEvent extends _SetDateRangeBlocEvent {
  const _$_SetDateRangeBlocEvent(this.activeRangeEnum) : super._();

  @override
  final DateRangeEnum activeRangeEnum;

  @override
  String toString() {
    return 'SetDateRangeBlocEvent(activeRangeEnum: $activeRangeEnum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetDateRangeBlocEvent &&
            (identical(other.activeRangeEnum, activeRangeEnum) ||
                other.activeRangeEnum == activeRangeEnum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeRangeEnum);

  @JsonKey(ignore: true)
  @override
  _$SetDateRangeBlocEventCopyWith<_SetDateRangeBlocEvent> get copyWith =>
      __$SetDateRangeBlocEventCopyWithImpl<_SetDateRangeBlocEvent>(
          this, _$identity);
}

abstract class _SetDateRangeBlocEvent extends SetDateRangeBlocEvent {
  const factory _SetDateRangeBlocEvent(DateRangeEnum activeRangeEnum) =
      _$_SetDateRangeBlocEvent;
  const _SetDateRangeBlocEvent._() : super._();

  @override
  DateRangeEnum get activeRangeEnum;
  @override
  @JsonKey(ignore: true)
  _$SetDateRangeBlocEventCopyWith<_SetDateRangeBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
