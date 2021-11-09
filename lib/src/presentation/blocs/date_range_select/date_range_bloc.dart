import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc_event.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc_state.dart';

class DateRangeBloc extends Bloc<DateRangeBlocEvent, DateRangeBlocState> {
  DateRangeBloc([DateRangeBlocState? initialState])
      : super(initialState ?? const DateRangeBlocState(activeRangeIndex: 0)) {
    on<SetDateRangeBlocEvent>((event, emit) {
      final index = state.dateRangeList.indexOf(event.get());
      emit(state.copyWith(activeRangeIndex: index));
    });
  }
}
