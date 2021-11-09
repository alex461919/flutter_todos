import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_todos/src/data/datasources/todos_datasource.dart';
import 'package:flutter_todos/src/data/mappers/todos_data_mappers.dart';
import 'package:flutter_todos/src/data/models/state_model.dart';
import 'package:flutter_todos/src/data/models/todo_model.dart';
import 'package:flutter_todos/src/domain/entities/state_entity.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/repositories/todos_repository.dart';
import 'package:rxdart/rxdart.dart';

class TodosDataRepositoryImpl implements TodosRepository {
  final TodosDataSource _todosDataSource;
  final DataRepositoryMapper _dataMapper;

  TodosDataRepositoryImpl(this._todosDataSource, this._dataMapper);

  @override
  Stream<List<StateEntity>> getStateList() {
    final stream = _todosDataSource.getStateList();
    return stream
        .map((event) => event.map(_dataMapper.mapStateToEntity).toList())
        .distinct((previous, next) => previous.equals(next));
  }

  @override
  Stream<List<TodoEntity>> getTodoList() {
    final stateStream = _todosDataSource.getStateList();
    final todoStream = _todosDataSource.getTodoList();
    return CombineLatestStream.combine2<List<TodoModel>, List<StateModel>, List<TodoEntity>>(
            todoStream,
            stateStream,
            (todoList, stateList) =>
                todoList.map((todoItem) => _dataMapper.mapTodoToEntity(todoItem, stateList)).toList())
        .distinct((previous, next) => previous.equals(next));
  }

  @override
  Future<void> addTodo(TodoEntity todo) => _todosDataSource.addTodo(_dataMapper.mapTodoFromEntity(todo));

  @override
  Future<void> updateTodo(TodoEntity todo) => _todosDataSource.updateTodo(_dataMapper.mapTodoFromEntity(todo));

  @override
  Future<void> deleteTodo(TodoEntity todo) => _todosDataSource.deleteTodo(_dataMapper.mapTodoFromEntity(todo));
}
