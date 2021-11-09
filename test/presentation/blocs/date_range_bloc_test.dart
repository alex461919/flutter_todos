import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc_event.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc_state.dart';

void main() {
  late DateRangeBloc dataRangeBloc;
  setUp(() {
    dataRangeBloc = DateRangeBloc();
  });

  tearDown(() async {
    await dataRangeBloc.close();
  });

  group('Data range bloc test.', () {
    test('Начальное состояние должно быть "Today".', () {
      expect(
          dataRangeBloc.state,
          allOf(
            [
              isA<DateRangeBlocState>(),
              predicate<DateRangeBlocState>((e) => e.activeRangeIndex == 0),
              predicate<DateRangeBlocState>((e) => e.activeRangeEnum == DateRangeEnum.Today),
            ],
          ));
    }, timeout: const Timeout(Duration(seconds: 5)));
    test('Начальное состояние должно быть "Tomorrow".', () async {
      await dataRangeBloc.close();
      dataRangeBloc = DateRangeBloc(const DateRangeBlocState(activeRangeIndex: 1));
      expect(
          dataRangeBloc.state,
          allOf(
            [
              isA<DateRangeBlocState>(),
              predicate<DateRangeBlocState>((e) => e.activeRangeIndex == 1),
              predicate<DateRangeBlocState>((e) => e.activeRangeEnum == DateRangeEnum.Tomorrow),
            ],
          ));
    }, timeout: const Timeout(Duration(seconds: 5)));

    blocTest<DateRangeBloc, DateRangeBlocState>(
      'Состояние должно быть "Always" -> "Tomorrow".',
      build: () {
        return DateRangeBloc();
      },
      act: (_bloc) async {
        await Future.delayed(
            const Duration(milliseconds: 100), () => _bloc.add(const SetDateRangeBlocEvent(DateRangeEnum.Always)));
        await Future.delayed(
            const Duration(milliseconds: 100), () => _bloc.add(const SetDateRangeBlocEvent(DateRangeEnum.Tomorrow)));
      },
      wait: const Duration(milliseconds: 2000),
      expect: () => [
        allOf(
          [
            isA<DateRangeBlocState>(),
            predicate<DateRangeBlocState>((e) => e.activeRangeIndex == 3),
            predicate<DateRangeBlocState>((e) => e.activeRangeEnum == DateRangeEnum.Always),
          ],
        ),
        allOf(
          [
            isA<DateRangeBlocState>(),
            predicate<DateRangeBlocState>((e) => e.activeRangeIndex == 1),
            predicate<DateRangeBlocState>((e) => e.activeRangeEnum == DateRangeEnum.Tomorrow),
          ],
        )
      ],
    );
  });
}
