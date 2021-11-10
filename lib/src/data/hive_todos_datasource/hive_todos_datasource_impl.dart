import 'dart:async';
import 'dart:math';

import 'package:flutter_todos/src/data/datasources/todos_datasource.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/mappers/hive_mapper.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/models/hive_state_model.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/models/hive_todo_model.dart';
import 'package:flutter_todos/src/data/models/state_model.dart';
import 'package:flutter_todos/src/data/models/todo_model.dart';
import 'package:flutter_todos/src/mix/logger.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

class HiveTodosDataSourceImpl implements TodosDataSource {
  //
  late final Box<HiveStateModel> _stateBox;
  late final Box<HiveTodoModel> _todoBox;

  final HiveMapper _mappers;
  final _stateSubject = BehaviorSubject<List<StateModel>>();
  final _todoSubject = BehaviorSubject<List<TodoModel>>();
  final _random = Random();

  HiveTodosDataSourceImpl(this._mappers);
  //
  // Для тестов только
  HiveTodosDataSourceImpl.test(this._mappers, this._stateBox, this._todoBox) {
    _todoBox.watch().listen(
          (_) => _todoSubject.add(_todoBox.toMap().entries.map(_mappers.mapTodoToModel).toList()),
          // ignore: avoid_types_on_closure_parameters
          onError: (Object error, StackTrace stackTrace) => logger.e('Hive error. ', error, stackTrace),
        );
    _stateBox.watch().listen(
          (_) => _stateSubject.add(_stateBox.toMap().entries.map(_mappers.mapStateToModel).toList()),
          // ignore: avoid_types_on_closure_parameters
          onError: (Object error, StackTrace stackTrace) => logger.e('Hive error. ', error, stackTrace),
        );
  }

  Future<void> init([Map<int, HiveStateModel>? fakeStates, Map<int, HiveTodoModel>? fakeTodos]) async {
    await Hive.initFlutter();
    //
    Hive
      ..registerAdapter(StateHiveModelAdapter())
      ..registerAdapter(TodoHiveModelAdapter())
      ..registerAdapter(IconDataAdapter())
      ..registerAdapter(ColorAdapter());

    await Future.wait(
      [
        Future.delayed(const Duration(milliseconds: 700), () async {
          _stateBox = await Hive.openBox<HiveStateModel>('states');
          await _stateBox.compact();
          if (fakeStates != null) {
            await _stateBox.clear();
            await _stateBox.putAll(fakeStates);
          }
          _stateSubject.add(_stateBox.toMap().entries.map(_mappers.mapStateToModel).toList());
        }),
        Future.delayed(const Duration(milliseconds: 500), () async {
          _todoBox = await Hive.openBox<HiveTodoModel>('todos');
          await _todoBox.compact();
          if (fakeTodos != null) await _todoBox.clear();
          _todoBox.watch().listen(
                (_) => _todoSubject.add(_todoBox.toMap().entries.map(_mappers.mapTodoToModel).toList()),
                // ignore: avoid_types_on_closure_parameters
                onError: (Object error, StackTrace stackTrace) => logger.e('Hive error. ', error, stackTrace),
              );
          if (fakeTodos != null) await _todoBox.putAll(fakeTodos);
        }),
      ],
    );
  }

  @override
  Stream<List<StateModel>> getStateList() => _stateSubject.stream;

  @override
  Stream<List<TodoModel>> getTodoList() => _todoSubject.stream;

  @override
  Future<void> addTodo(TodoModel todo) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (todo.id != null) throw Exception('Unable to add todo, id should be null.');
    if (_random.nextDouble() < 0.3) throw Exception('This is test error add todo.');
    await _todoBox.add(_mappers.mapTodoFromModel(todo).value);
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final todoHiveModel = _mappers.mapTodoFromModel(todo);
    final dynamic key = todoHiveModel.key;
    if (key == null) throw Exception('Unable to update todo, unknown id.');
    if (!_todoBox.containsKey(key)) throw Exception('Unable to update todo, not found.');
    if (_random.nextDouble() < 0.3) throw Exception('This is test error update todo.');
    await _todoBox.put(key, todoHiveModel.value);
  }

  @override
  Future<void> deleteTodo(TodoModel todo) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final dynamic key = _mappers.mapTodoFromModel(todo).key;
    if (key == null) throw Exception('Unable to delete todo, unknown id.');
    if (!_todoBox.containsKey(key)) throw Exception('Unable to delete todo, not found.');
    if (_random.nextDouble() < 0.3) throw Exception('This is test error delete todo.');
    await _todoBox.delete(key);
  }
}
