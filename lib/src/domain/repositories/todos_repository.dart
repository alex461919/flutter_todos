import 'dart:async';

import 'package:flutter_todos/src/domain/entities/state_entity.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';

abstract class TodosRepository {
  Stream<List<StateEntity>> getStateList();
  Stream<List<TodoEntity>> getTodoList();
  Future<void> addTodo(TodoEntity todo);
  Future<void> updateTodo(TodoEntity todo);
  Future<void> deleteTodo(TodoEntity todo);
}
