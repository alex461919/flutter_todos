import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_model.freezed.dart';

@freezed
class StateModel with _$StateModel {
  const factory StateModel({
    required String id,
    required String description,
    required IconData icon,
    required Color color,
    required double opacity,
  }) = _StateModel;
}
