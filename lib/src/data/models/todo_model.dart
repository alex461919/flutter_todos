import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required String title,
    required int date, // millisecondsSinceEpoch
    required String state,
    String? id,
    String? note,
  }) = _TodoModel;
}
