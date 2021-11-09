import 'package:flutter/material.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/models/hive_state_model.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/models/hive_todo_model.dart';
import 'package:flutter_todos/src/data/models/state_model.dart';
import 'package:flutter_todos/src/data/models/todo_model.dart';
import 'package:flutter_todos/src/domain/entities/state_entity.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';

const hiveState1Model =
    HiveStateModel(description: 'description1', icon: Icons.schedule, color: Colors.blue, opacity: 0.1);
const hiveTodo1Model = HiveTodoModel(title: 'title1', note: 'note1', date: 1609434000000, state: 1);
//
const state1Model =
    StateModel(id: '1', description: 'description1', icon: Icons.schedule, color: Colors.blue, opacity: 0.1);
const state1Entity =
    StateEntity(id: '1', description: 'description1', icon: Icons.schedule, color: Colors.blue, opacity: 0.1);
//
const state2Model =
    StateModel(id: '2', description: 'description2', icon: Icons.done_all, color: Colors.green, opacity: 0.2);
const state2Entity =
    StateEntity(id: '2', description: 'description2', icon: Icons.done_all, color: Colors.green, opacity: 0.2);
//
const todo1Model = TodoModel(id: '1', title: 'title1', note: 'note1', date: 1609434000000, state: '1');
final todo1Entity =
    TodoEntity(id: '1', title: 'title1', note: 'note1', date: DateTime(2021, 1, 1), state: state1Entity);
//
const todo2Model = TodoModel(id: '2', title: 'title2', note: 'note2', date: 1609520400000, state: '2');
final todo2Entity =
    TodoEntity(id: '2', title: 'title2', note: 'note2', date: DateTime(2021, 1, 2), state: state2Entity);
