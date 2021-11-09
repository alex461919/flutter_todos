import 'package:hive_flutter/hive_flutter.dart';

part 'hive_todo_model.g.dart';

@HiveType(typeId: 32, adapterName: 'TodoHiveModelAdapter')
class HiveTodoModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String? note;
  @HiveField(2)
  final int date;
  @HiveField(3)
  final int state;

  const HiveTodoModel({
    required this.title,
    this.note,
    required this.date,
    required this.state,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HiveTodoModel &&
        other.title == title &&
        other.note == note &&
        other.date == date &&
        other.state == state;
  }

  @override
  int get hashCode {
    return title.hashCode ^ note.hashCode ^ date.hashCode ^ state.hashCode;
  }

  @override
  String toString() {
    return 'HiveTodoModel(title: $title, note: $note, date: $date, state: $state)';
  }
}
