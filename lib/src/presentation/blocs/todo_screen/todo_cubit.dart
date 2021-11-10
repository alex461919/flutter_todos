import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/usecases/delete_todo_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/get_sate_list_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/get_todo_list_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/update_todo_usecase.dart';
import 'package:flutter_todos/src/mix/logger.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_screen/todo_state.dart';

class TodoCubit extends Cubit<TodoCubitState> {
  //

  final GetTodoListUseCase _getTodoListUseCase;
  final GetStateListUseCase _getStateListUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  StreamSubscription<TodoCubitState>? _todoBlocStateStreamSubscription;

  final String _id;

  TodoCubit(
      this._getTodoListUseCase, this._getStateListUseCase, this._updateTodoUseCase, this._deleteTodoUseCase, this._id)
      : super(const TodoCubitState(process: Process.pending)) {
    _todoBlocStateStreamSubscription = _getTodoListUseCase.call(_whereParams(_id)).asyncMap((todos) async {
      if (todos.length != 1 || todos[0].id != _id) throw Exception('Cannot find todo with id $_id');
      return TodoCubitState(process: Process.fulfilled, todo: todos[0], stateList: await _getStateListUseCase.call());

      // ignore: avoid_types_on_closure_parameters
    }).listen(emit, onError: (Object error) {
      if (state.process != Process.delete && state.process != Process.dispose) {
        emit(TodoCubitState(process: Process.reject, exception: error as Exception));
      }
    });
  }

  Future<void> updateTodo(TodoEntity todo) async {
    emit(state.copyWith(process: Process.update));
    try {
      await _updateTodoUseCase
          .call(UpdateTodoUseCaseParams(todo))
          .then((_) => emit(state.copyWith(process: Process.fulfilled)));
    } on Object catch (error) {
      emit(state.copyWith(process: Process.reject, exception: error as Exception));
    }
  }

  Future<void> deleteTodo(TodoEntity todo) async {
    emit(state.copyWith(process: Process.delete));
    try {
      await _deleteTodoUseCase.call(DeleteTodoUseCaseParams(todo));
      emit(state.copyWith(process: Process.dispose));
    } on Exception catch (error) {
      emit(state.copyWith(process: Process.reject, exception: error));
    }
  }

  GetTodoListUseCaseParams _whereParams(String id) => GetTodoListUseCaseParams((todo) => todo.id == id);

  @override
  Future<void> close() async {
    await _todoBlocStateStreamSubscription?.cancel();
    await super.close();
  }
}
