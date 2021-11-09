import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/mappers/hive_mapper.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/models/hive_state_model.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/models/hive_todo_model.dart';
import 'package:flutter_todos/src/data/models/state_model.dart';
import 'package:flutter_todos/src/data/models/todo_model.dart';

void main() {
  group('hive mappers test.', () {
    final hiveMapper = HiveMapper();

    group('State mapper.', () {
      const hiveStateMapEntry = MapEntry(
          1, HiveStateModel(description: 'description1', icon: Icons.schedule, color: Colors.blue, opacity: 1));
      const dataStateModel =
          StateModel(id: '1', description: 'description1', icon: Icons.schedule, color: Colors.blue, opacity: 1);

      test('Значения свойств совпадают.', () {
        expect(hiveMapper.mapStateToModel(hiveStateMapEntry), equals(dataStateModel));
      });
    });
    group('Todo mapper.', () {
      const todoHiveModel = HiveTodoModel(title: 'title1', note: 'note1', date: 1632389127, state: 1);
      const hiveTodoMapEntry = MapEntry(1, todoHiveModel);
      const dataTodoMpdel = TodoModel(id: '1', title: 'title1', note: 'note1', date: 1632389127, state: '1');
      test('Значения свойств совпадают.', () {
        expect(hiveMapper.mapTodoToModel(hiveTodoMapEntry), equals(dataTodoMpdel));
        expect(hiveMapper.mapTodoFromModel(dataTodoMpdel).equals(hiveTodoMapEntry), isTrue);
      });
      test('Key из Hive не может быть null. Выкинет Exception.', () {
        expect(() => hiveMapper.mapTodoToModel(const MapEntry<dynamic, HiveTodoModel>(null, todoHiveModel)),
            throwsException);
      });
    });
  });
}

extension MapEntryEquals on MapEntry {
  // ignore: avoid_annotating_with_dynamic
  bool equals(dynamic other) => other is MapEntry && key == other.key && value == other.value;
}
