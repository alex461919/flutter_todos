import 'package:flutter_todos/src/data/hive_todos_datasource/models/hive_state_model.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/models/hive_todo_model.dart';
import 'package:flutter_todos/src/data/models/state_model.dart';
import 'package:flutter_todos/src/data/models/todo_model.dart';

class HiveMapper {
  StateModel mapStateToModel(MapEntry<dynamic, HiveStateModel> state) {
    return StateModel(
      id: state.key.toString(),
      description: state.value.description,
      icon: state.value.icon,
      color: state.value.color,
      opacity: state.value.opacity,
    );
  }

  MapEntry<dynamic, HiveTodoModel> mapTodoFromModel(TodoModel todo) {
    return MapEntry<dynamic, HiveTodoModel>(
      todo.id != null ? int.tryParse(todo.id!) : null,
      HiveTodoModel(
        title: todo.title,
        note: todo.note,
        date: todo.date,
        state: int.parse(todo.state),
      ),
    );
  }

  TodoModel mapTodoToModel(MapEntry<dynamic, HiveTodoModel> todo) {
    if (todo.key == null) throw Exception('Primary key cannot be null');
    return TodoModel(
      id: todo.key.toString(),
      title: todo.value.title,
      note: todo.value.note,
      date: todo.value.date,
      state: todo.value.state.toString(),
    );
  }
}
