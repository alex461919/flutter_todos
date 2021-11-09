import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/usecases/get_todo_list_usecase.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_list_screen/todo_list_events.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_list_screen/todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListBlocEvent, TodoListBlocState> {
  //
  StreamSubscription<List<TodoEntity>>? _todoListStreamSubscription;
  final GetTodoListUseCase getTodoListUseCase;
  final DateTimeRange Function() dateRangeFn;

  TodoListBloc(this.getTodoListUseCase, this.dateRangeFn) : super(const InitTodoListBlocState()) {
    //
    on<FetchTodoListBlocEvent>((event, emit) {
      _todoListStreamSubscription = getTodoListUseCase.call(whereParams(dateRangeFn)).listen((val) {
        add(NewTodoListBlocEvent(val));
        // ignore: avoid_types_on_closure_parameters
      }, onError: (Object e) {
        add(ErrorTodoListBlocEvent(e as Exception));
      });
      emit(const PendingTodoListBlocState());
    });
    on<ErrorTodoListBlocEvent>((event, emit) {
      emit(RejectedTodoListBlocState(event.get()));
    });
    on<NewTodoListBlocEvent>((event, emit) {
      emit(FulfilledTodoListBlocState(toSortedMap(event.get())));
    });
    Future.delayed(Duration.zero, () => add(const FetchTodoListBlocEvent()));
  }

  GetTodoListUseCaseParams whereParams(DateTimeRange Function() rangeFn) {
    bool fn(TodoEntity todo) {
      final range = rangeFn();
      return todo.date.isAfter(range.start) && todo.date.isBefore(range.end) || todo.date.isAtSameMomentAs(range.start);
    }

    return GetTodoListUseCaseParams(fn);
  }

  static Map<DateTime, List<TodoEntity>> toSortedMap(List<TodoEntity> list) {
    final _list = [...list]..sort((t1, t2) => t1.date.compareTo(t2.date));
    return _list.fold<Map<DateTime, List<TodoEntity>>>({}, (tree, item) {
      final _date = DateTime(item.date.year, item.date.month, item.date.day);
      if (tree.containsKey(_date)) {
        tree[_date]!.add(item);
      } else {
        tree.addAll({
          _date: [item]
        });
      }
      return tree;
    });
  }

  @override
  Future<void> close() async {
    await _todoListStreamSubscription?.cancel();
    await super.close();
  }
}
