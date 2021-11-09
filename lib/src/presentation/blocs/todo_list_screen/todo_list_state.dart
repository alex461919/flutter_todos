import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_state.freezed.dart';

abstract class TodoListBlocState {
  const TodoListBlocState();
}

class InitTodoListBlocState extends TodoListBlocState {
  const InitTodoListBlocState();
}

class PendingTodoListBlocState extends TodoListBlocState {
  const PendingTodoListBlocState();
}

@freezed
class FulfilledTodoListBlocState extends TodoListBlocState with _$FulfilledTodoListBlocState {
  const FulfilledTodoListBlocState._();
  const factory FulfilledTodoListBlocState(Map<DateTime, List<TodoEntity>> map) = _FulfilledTodoListBlocState;
  Map<DateTime, List<TodoEntity>> get() => map;
}

@freezed
class RejectedTodoListBlocState extends TodoListBlocState with _$RejectedTodoListBlocState {
  const RejectedTodoListBlocState._();
  const factory RejectedTodoListBlocState(Exception exception) = _RejectedTodoListBlocState;
  Exception get() => exception;
}
/*
@freezed
class TodoListBlockState with _$TodoListBlockState {
  const factory TodoListBlockState({
    required TodoListState todolist,
    required int currentRange,
    @Default([Today(), Tomorrow(), Weekly(), Always()]) List<DateRange> dateTimeRangeList,
  }) = _TodoListBlockState;
}

abstract class DateRange {
  //
  final String title;
  final DateTimeRange Function() range;
  const DateRange(this.title, this.range);
  //
  static DateTimeRange getDateRange(Duration start, Duration end) {
    final dateTimeNow = DateTime.now();
    final dateNow = DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);
    return DateTimeRange(start: dateNow.add(start), end: dateNow.add(end));
  }
}

class Today extends DateRange {
  static DateTimeRange _getRange() => DateRange.getDateRange(const Duration(), const Duration(days: 1));
  const Today() : super('Сегодня', _getRange);
}

class Tomorrow extends DateRange {
  static DateTimeRange _getRange() => DateRange.getDateRange(const Duration(days: 1), const Duration(days: 2));
  const Tomorrow() : super('Завтра', _getRange);
}

class Weekly extends DateRange {
  static DateTimeRange _getRange() => DateRange.getDateRange(const Duration(), const Duration(days: 7));
  const Weekly() : super('На неделю', _getRange);
}

class Always extends DateRange {
  static DateTimeRange _getRange() => null;
  const Always() : super('За все время', _getRange);
}
*/