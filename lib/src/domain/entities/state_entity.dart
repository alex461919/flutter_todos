import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_entity.freezed.dart';

@freezed
class StateEntity with _$StateEntity {
  const factory StateEntity({
    required String id,
    required String description,
    required IconData icon,
    required Color color,
    @Default(1) double opacity,
  }) = _StateEntity;
} 

// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter packages pub run build_runner watch --delete-conflicting-outputs
