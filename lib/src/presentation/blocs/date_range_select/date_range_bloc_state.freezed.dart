// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'date_range_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DateRangeBlocStateTearOff {
  const _$DateRangeBlocStateTearOff();

  _DateRangeBlocState call(
      {required int activeRangeIndex,
      List<DateRangeEnum> dateRangeList = const [
        DateRangeEnum.Today,
        DateRangeEnum.Tomorrow,
        DateRangeEnum.Weekly,
        DateRangeEnum.Always
      ]}) {
    return _DateRangeBlocState(
      activeRangeIndex: activeRangeIndex,
      dateRangeList: dateRangeList,
    );
  }
}

/// @nodoc
const $DateRangeBlocState = _$DateRangeBlocStateTearOff();

/// @nodoc
mixin _$DateRangeBlocState {
  int get activeRangeIndex => throw _privateConstructorUsedError;
  List<DateRangeEnum> get dateRangeList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DateRangeBlocStateCopyWith<DateRangeBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateRangeBlocStateCopyWith<$Res> {
  factory $DateRangeBlocStateCopyWith(
          DateRangeBlocState value, $Res Function(DateRangeBlocState) then) =
      _$DateRangeBlocStateCopyWithImpl<$Res>;
  $Res call({int activeRangeIndex, List<DateRangeEnum> dateRangeList});
}

/// @nodoc
class _$DateRangeBlocStateCopyWithImpl<$Res>
    implements $DateRangeBlocStateCopyWith<$Res> {
  _$DateRangeBlocStateCopyWithImpl(this._value, this._then);

  final DateRangeBlocState _value;
  // ignore: unused_field
  final $Res Function(DateRangeBlocState) _then;

  @override
  $Res call({
    Object? activeRangeIndex = freezed,
    Object? dateRangeList = freezed,
  }) {
    return _then(_value.copyWith(
      activeRangeIndex: activeRangeIndex == freezed
          ? _value.activeRangeIndex
          : activeRangeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      dateRangeList: dateRangeList == freezed
          ? _value.dateRangeList
          : dateRangeList // ignore: cast_nullable_to_non_nullable
              as List<DateRangeEnum>,
    ));
  }
}

/// @nodoc
abstract class _$DateRangeBlocStateCopyWith<$Res>
    implements $DateRangeBlocStateCopyWith<$Res> {
  factory _$DateRangeBlocStateCopyWith(
          _DateRangeBlocState value, $Res Function(_DateRangeBlocState) then) =
      __$DateRangeBlocStateCopyWithImpl<$Res>;
  @override
  $Res call({int activeRangeIndex, List<DateRangeEnum> dateRangeList});
}

/// @nodoc
class __$DateRangeBlocStateCopyWithImpl<$Res>
    extends _$DateRangeBlocStateCopyWithImpl<$Res>
    implements _$DateRangeBlocStateCopyWith<$Res> {
  __$DateRangeBlocStateCopyWithImpl(
      _DateRangeBlocState _value, $Res Function(_DateRangeBlocState) _then)
      : super(_value, (v) => _then(v as _DateRangeBlocState));

  @override
  _DateRangeBlocState get _value => super._value as _DateRangeBlocState;

  @override
  $Res call({
    Object? activeRangeIndex = freezed,
    Object? dateRangeList = freezed,
  }) {
    return _then(_DateRangeBlocState(
      activeRangeIndex: activeRangeIndex == freezed
          ? _value.activeRangeIndex
          : activeRangeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      dateRangeList: dateRangeList == freezed
          ? _value.dateRangeList
          : dateRangeList // ignore: cast_nullable_to_non_nullable
              as List<DateRangeEnum>,
    ));
  }
}

/// @nodoc

class _$_DateRangeBlocState extends _DateRangeBlocState {
  const _$_DateRangeBlocState(
      {required this.activeRangeIndex,
      this.dateRangeList = const [
        DateRangeEnum.Today,
        DateRangeEnum.Tomorrow,
        DateRangeEnum.Weekly,
        DateRangeEnum.Always
      ]})
      : super._();

  @override
  final int activeRangeIndex;
  @JsonKey(defaultValue: const [
    DateRangeEnum.Today,
    DateRangeEnum.Tomorrow,
    DateRangeEnum.Weekly,
    DateRangeEnum.Always
  ])
  @override
  final List<DateRangeEnum> dateRangeList;

  @override
  String toString() {
    return 'DateRangeBlocState(activeRangeIndex: $activeRangeIndex, dateRangeList: $dateRangeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DateRangeBlocState &&
            (identical(other.activeRangeIndex, activeRangeIndex) ||
                other.activeRangeIndex == activeRangeIndex) &&
            const DeepCollectionEquality()
                .equals(other.dateRangeList, dateRangeList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeRangeIndex,
      const DeepCollectionEquality().hash(dateRangeList));

  @JsonKey(ignore: true)
  @override
  _$DateRangeBlocStateCopyWith<_DateRangeBlocState> get copyWith =>
      __$DateRangeBlocStateCopyWithImpl<_DateRangeBlocState>(this, _$identity);
}

abstract class _DateRangeBlocState extends DateRangeBlocState {
  const factory _DateRangeBlocState(
      {required int activeRangeIndex,
      List<DateRangeEnum> dateRangeList}) = _$_DateRangeBlocState;
  const _DateRangeBlocState._() : super._();

  @override
  int get activeRangeIndex;
  @override
  List<DateRangeEnum> get dateRangeList;
  @override
  @JsonKey(ignore: true)
  _$DateRangeBlocStateCopyWith<_DateRangeBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
