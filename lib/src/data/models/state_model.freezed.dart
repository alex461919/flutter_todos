// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StateModelTearOff {
  const _$StateModelTearOff();

  _StateModel call(
      {required String id,
      required String description,
      required IconData icon,
      required Color color,
      required double opacity}) {
    return _StateModel(
      id: id,
      description: description,
      icon: icon,
      color: color,
      opacity: opacity,
    );
  }
}

/// @nodoc
const $StateModel = _$StateModelTearOff();

/// @nodoc
mixin _$StateModel {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  double get opacity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StateModelCopyWith<StateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateModelCopyWith<$Res> {
  factory $StateModelCopyWith(
          StateModel value, $Res Function(StateModel) then) =
      _$StateModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String description,
      IconData icon,
      Color color,
      double opacity});
}

/// @nodoc
class _$StateModelCopyWithImpl<$Res> implements $StateModelCopyWith<$Res> {
  _$StateModelCopyWithImpl(this._value, this._then);

  final StateModel _value;
  // ignore: unused_field
  final $Res Function(StateModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? icon = freezed,
    Object? color = freezed,
    Object? opacity = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      opacity: opacity == freezed
          ? _value.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$StateModelCopyWith<$Res> implements $StateModelCopyWith<$Res> {
  factory _$StateModelCopyWith(
          _StateModel value, $Res Function(_StateModel) then) =
      __$StateModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String description,
      IconData icon,
      Color color,
      double opacity});
}

/// @nodoc
class __$StateModelCopyWithImpl<$Res> extends _$StateModelCopyWithImpl<$Res>
    implements _$StateModelCopyWith<$Res> {
  __$StateModelCopyWithImpl(
      _StateModel _value, $Res Function(_StateModel) _then)
      : super(_value, (v) => _then(v as _StateModel));

  @override
  _StateModel get _value => super._value as _StateModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? icon = freezed,
    Object? color = freezed,
    Object? opacity = freezed,
  }) {
    return _then(_StateModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      opacity: opacity == freezed
          ? _value.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_StateModel implements _StateModel {
  const _$_StateModel(
      {required this.id,
      required this.description,
      required this.icon,
      required this.color,
      required this.opacity});

  @override
  final String id;
  @override
  final String description;
  @override
  final IconData icon;
  @override
  final Color color;
  @override
  final double opacity;

  @override
  String toString() {
    return 'StateModel(id: $id, description: $description, icon: $icon, color: $color, opacity: $opacity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StateModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.opacity, opacity) || other.opacity == opacity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, icon, color, opacity);

  @JsonKey(ignore: true)
  @override
  _$StateModelCopyWith<_StateModel> get copyWith =>
      __$StateModelCopyWithImpl<_StateModel>(this, _$identity);
}

abstract class _StateModel implements StateModel {
  const factory _StateModel(
      {required String id,
      required String description,
      required IconData icon,
      required Color color,
      required double opacity}) = _$_StateModel;

  @override
  String get id;
  @override
  String get description;
  @override
  IconData get icon;
  @override
  Color get color;
  @override
  double get opacity;
  @override
  @JsonKey(ignore: true)
  _$StateModelCopyWith<_StateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
