import 'package:flutter_todos/src/domain/entities/state_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    required String title,
    required DateTime date,
    required StateEntity state,
    String? id,
    String? note,
  }) = _TodoEntity;
}
