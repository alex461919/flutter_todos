import 'package:flutter_todos/src/data/models/state_model.dart';
import 'package:flutter_todos/src/data/models/todo_model.dart';
import 'package:flutter_todos/src/domain/entities/state_entity.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';

class DataRepositoryMapper {
  // Просто proxy
  StateModel mapStateFromEntity(StateEntity state) {
    return StateModel(
      id: state.id,
      description: state.description,
      icon: state.icon,
      color: state.color,
      opacity: state.opacity,
    );
  }

  StateEntity mapStateToEntity(StateModel state) {
    return StateEntity(
      id: state.id,
      description: state.description,
      icon: state.icon,
      color: state.color,
      opacity: state.opacity,
    );
  }

  TodoModel mapTodoFromEntity(TodoEntity todo) {
    return TodoModel(
      id: todo.id,
      title: todo.title,
      note: todo.note,
      date: todo.date.millisecondsSinceEpoch,
      state: todo.state.id,
    );
  }

  TodoEntity mapTodoToEntity(TodoModel todo, List<StateModel> stateList) {
    final foundState = stateList.firstWhere((element) => todo.state == element.id,
        orElse: () => throw Exception('Bad state. id: ${todo.state}'));
    return TodoEntity(
      id: todo.id,
      title: todo.title,
      note: todo.note,
      date: DateTime.fromMillisecondsSinceEpoch(todo.date),
      state: mapStateToEntity(foundState),
    );
  }
}
