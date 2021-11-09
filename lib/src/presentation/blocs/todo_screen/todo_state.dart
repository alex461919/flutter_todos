// ignore_for_file: overridden_fields

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_todos/src/domain/entities/state_entity.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';

enum Process { pending, reject, fulfilled, update, delete, dispose }

class TodoCubitState {
  final Process process;
  final TodoEntity? todo;
  final List<StateEntity>? stateList;
  final Exception? exception;
  const TodoCubitState({required this.process, this.todo, this.stateList, this.exception});

  TodoCubitState copyWith({
    Process? process,
    TodoEntity? todo,
    List<StateEntity>? stateList,
    Exception? exception,
  }) {
    return TodoCubitState(
      process: process ?? this.process,
      todo: todo ?? this.todo,
      stateList: stateList ?? this.stateList,
      exception: exception ?? this.exception,
    );
  }

  @override
  String toString() {
    return 'TodoCubitState(process: $process, todo: $todo, stateList: $stateList, exception: $exception)';
  }
}
/*
class PendingTodoCubitState extends TodoCubitState {
  const PendingTodoCubitState(): super(state: Process.pending);
}

class RejectedTodoCubitState extends TodoCubitState {
  factory RejectedTodoCubitState(TodoCubitState oldState, Exception exception) {
    return oldState.copyWith(exception: exception) as RejectedTodoCubitState;
  }
  Exception get() => exception!;
}

class FulfilledTodoCubitState extends TodoCubitState {
  @override
  final TodoEntity todo;
  @override
  final List<StateEntity> stateList;

  const FulfilledTodoCubitState({required this.todo, required this.stateList});
  factory FulfilledTodoCubitState.copy(TodoCubitState _todoCubitState) {
    assert(_todoCubitState.todo != null);
    assert(_todoCubitState.stateList != null);
    return FulfilledTodoCubitState(todo: _todoCubitState.todo!, stateList: _todoCubitState.stateList!);
  }
}

class WillDoUpdateTodoCubitState extends FulfilledTodoCubitState {
  const WillDoUpdateTodoCubitState({required TodoEntity todo, required List<StateEntity> stateList})
      : super(todo: todo, stateList: stateList);
}
*/



/*
part 'todo_state.freezed.dart';

abstract class TodoCubitState { 
  const TodoCubitState();
}

class PendingTodoCubitState extends TodoCubitState {
  const PendingTodoCubitState();
}

@freezed
class FulfilledTodoCubitState extends TodoCubitState with _$FulfilledTodoCubitState {
  const FulfilledTodoCubitState._();
  const factory FulfilledTodoCubitState({required TodoEntity todo, required List<StateEntity> stateList}) =
      _FulfilledTodoCubitState;
  TodoEntity get() => todo;
}

@freezed
class RejectedTodoCubitState extends TodoCubitState with _$RejectedTodoCubitState {
  const RejectedTodoCubitState._();
  const factory RejectedTodoCubitState(Exception exception) = _RejectedTodoCubitState;
  Exception get() => exception;
}

@freezed
class DoingUpdateTodoCubitState extends TodoCubitState with _$DoingUpdateTodoCubitState {
  const DoingUpdateTodoCubitState._();
  const factory DoingUpdateTodoCubitState({required TodoEntity todo, required List<StateEntity> stateList}) =
      _DoingUpdateTodoCubitState;
  TodoEntity get() => todo;
}

@freezed
class DoingDeleteTodoCubitState extends TodoCubitState with _$DoingDeleteTodoCubitState {
  const DoingDeleteTodoCubitState._();
  const factory DoingDeleteTodoCubitState({required TodoEntity todo, required List<StateEntity> stateList}) =
      _DoingDeleteTodoCubitState;
  TodoEntity get() => todo;
}
*/