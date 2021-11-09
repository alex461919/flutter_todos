import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/hive_todos_datasource_impl.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/mappers/hive_mapper.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/models/hive_state_model.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/models/hive_todo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

import '../../fake_test_data.dart';

extension MapEntryEquals on MapEntry {
  // ignore: avoid_annotating_with_dynamic
  bool equals(dynamic other) => other is MapEntry && key == other.key && value == other.value;
}

void main() {
  group('todos hive datasource impl test.', () {
    late Box<HiveStateModel> stateBox;
    late Box<HiveTodoModel> todoBox;
    late HiveTodosDataSourceImpl todosHiveDataSourceImpl;

    const hiveStateMapEntry = MapEntry(1, hiveState1Model);

    setUpAll(() {
      Hive
        ..init(Directory.current.path)
        ..registerAdapter(StateHiveModelAdapter())
        ..registerAdapter(TodoHiveModelAdapter())
        ..registerAdapter(IconDataAdapter())
        ..registerAdapter(ColorAdapter());
    });
    setUp(() async {
      todoBox = await Hive.openBox<HiveTodoModel>('todos');
      await todoBox.clear();
      stateBox = await Hive.openBox<HiveStateModel>('states');
      await stateBox.clear();
      todosHiveDataSourceImpl = HiveTodosDataSourceImpl.test(HiveMapper(), stateBox, todoBox);
    });
    tearDown(() async {
      await todoBox.deleteFromDisk();
      await stateBox.deleteFromDisk();
    });

    group('State.', () {
      test('Очередь должна быть пустая.', () {
        final stream = todosHiveDataSourceImpl.getStateList();
        expect((stream as ValueStream).hasValue, isFalse);
      });
      test('Очередь должна не быть пустая и значение должны совпасть.', () async {
        final todosLocalDataSourceImpl = HiveTodosDataSourceImpl.test(HiveMapper(), stateBox, todoBox);
        await stateBox.putAll(Map<dynamic, HiveStateModel>.fromEntries([hiveStateMapEntry]));
        final stream = todosLocalDataSourceImpl.getStateList();
        expect(await stream.first, equals([state1Model]));
      });
    });
    group('Todo.', () {
      const hiveTodoMapEntry = MapEntry(1, hiveTodo1Model);

      test('Очередь должна быть пустая.', () {
        final stream = todosHiveDataSourceImpl.getTodoList();
        expect((stream as ValueStream).hasValue, isFalse);
      });
      test('Очередь должна не быть пустая и значение должны совпасть.', () async {
        final stream = todosHiveDataSourceImpl.getTodoList();
        await todoBox.putAll(Map<dynamic, HiveTodoModel>.fromEntries([hiveTodoMapEntry]));
        expect(await stream.first, equals([todo1Model]));
      });

      test('Add. Должен выдать Exception (id != null)', () async {
        expect(() => todosHiveDataSourceImpl.addTodo(todo1Model.copyWith(id: '5')), throwsException);
      });
      test('Add. Значение должны совпасть.', () async {
        final stream = todosHiveDataSourceImpl.getTodoList();
        expect(stream, emits([todo1Model.copyWith(id: '0')]));
        await todosHiveDataSourceImpl.addTodo(todo1Model.copyWith(id: null));
      });
      test('Update. Должен выдать Exception (id == null)', () async {
        expect(() => todosHiveDataSourceImpl.updateTodo(todo1Model.copyWith(id: null)), throwsException);
      });
      test('Update. Должен выдать Exception (записи с таки ключем не существует)', () async {
        expect(() => todosHiveDataSourceImpl.updateTodo(todo1Model), throwsException);
      });
      test('Update. Значения должны совпасть.', () async {
        final stream = todosHiveDataSourceImpl.getTodoList();
        expect(
            stream,
            emitsInOrder(<dynamic>[
              [todo1Model],
              [todo1Model.copyWith(title: 'updated')]
            ]));
        await todoBox.putAll(Map<dynamic, HiveTodoModel>.fromEntries([hiveTodoMapEntry]));
        await todosHiveDataSourceImpl.updateTodo(todo1Model.copyWith(title: 'updated'));
      });

      test('Delete. Должен выдать Exception (id == null)', () {
        expect(() => todosHiveDataSourceImpl.deleteTodo(todo1Model.copyWith(id: null)), throwsException);
      });
      test('Delete. Должен выдать Exception (записи с таки ключем не существует)', () async {
        expect(() => todosHiveDataSourceImpl.deleteTodo(todo1Model), throwsException);
      });
      test('Delete. Значения должны совпасть.', () async {
        final stream = todosHiveDataSourceImpl.getTodoList();
        expect(
            stream,
            emitsInOrder(<dynamic>[
              [todo1Model],
              <dynamic>[]
            ]));
        await todoBox.putAll(Map<dynamic, HiveTodoModel>.fromEntries([hiveTodoMapEntry]));
        await todosHiveDataSourceImpl.deleteTodo(todo1Model);
      });
    });
  });
}
