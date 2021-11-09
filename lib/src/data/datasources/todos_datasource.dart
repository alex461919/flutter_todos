import 'dart:async';

import 'package:flutter_todos/src/data/models/state_model.dart';
import 'package:flutter_todos/src/data/models/todo_model.dart';

abstract class TodosDataSource {
  Stream<List<StateModel>> getStateList();
  Stream<List<TodoModel>> getTodoList();
  Future<void> addTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo);
  Future<void> deleteTodo(TodoModel todo);
}
