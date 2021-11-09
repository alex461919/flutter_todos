import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_events.freezed.dart';

abstract class TodoListBlocEvent {
  const TodoListBlocEvent();
}

class FetchTodoListBlocEvent extends TodoListBlocEvent {
  const FetchTodoListBlocEvent();
}

@freezed
class NewTodoListBlocEvent extends TodoListBlocEvent with _$NewTodoListBlocEvent {
  const NewTodoListBlocEvent._();
  const factory NewTodoListBlocEvent(List<TodoEntity> list) = _NewTodoListBlocEvent;
  List<TodoEntity> get() => list;
}

@freezed
class ErrorTodoListBlocEvent extends TodoListBlocEvent with _$ErrorTodoListBlocEvent {
  const ErrorTodoListBlocEvent._();
  const factory ErrorTodoListBlocEvent(Exception exception) = _ErrorTodoListBlocEvent;
  Exception get() => exception;
}
