import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_range_bloc_event.freezed.dart';

abstract class DateRangeBlocEvent {
  const DateRangeBlocEvent();
}

@freezed
class SetDateRangeBlocEvent extends DateRangeBlocEvent with _$SetDateRangeBlocEvent {
  const SetDateRangeBlocEvent._();
  const factory SetDateRangeBlocEvent(DateRangeEnum activeRangeEnum) = _SetDateRangeBlocEvent;
  DateRangeEnum get() => activeRangeEnum;
}
