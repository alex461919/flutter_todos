import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc_event.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc_state.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_list_screen/todo_list_bloc.dart';
import 'package:flutter_todos/src/presentation/pages/todo_list/material_todo_list_page.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake_test_data.dart';

Widget wrap({Widget? child}) {
  return MaterialApp(localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ], supportedLocales: const [
    Locale('en', 'US'),
    Locale('ru', 'RU'),
  ], home: Scaffold(body: child));
}

final dateFormat = DateFormat.yMMMMEEEEd('ru_RU');

class MockDateRangeBloc extends MockBloc<DateRangeBlocEvent, DateRangeBlocState> implements DateRangeBloc {}

class DateRangeBlocStateFake extends Fake implements DateRangeBlocState {}

class DateRangeBlocEventFake extends Fake implements DateRangeBlocEvent {}

Type typeOf<T>() => T;

void main() {
  setUp(() {});
  tearDown(() async {});
  group('Главная страница со списком.', () {
    testWidgets('TodoItem test', (tester) async {
      await tester.pumpWidget(wrap(child: TodoItem(todo1Entity)));
      expect(find.text(todo1Entity.title), findsOneWidget);
      expect(find.text(todo1Entity.state.description), findsOneWidget);
      expect(find.byIcon(todo1Entity.state.icon), findsOneWidget);
    }, timeout: const Timeout(Duration(seconds: 5)));
    testWidgets('DayItem test', (tester) async {
      await tester.pumpWidget(wrap(child: DayItem([todo1Entity, todo2Entity])));
      expect(find.text(todo1Entity.title), findsOneWidget);
      expect(find.text(todo1Entity.state.description), findsOneWidget);
      expect(find.byIcon(todo1Entity.state.icon), findsOneWidget);
      expect(find.text(todo2Entity.title), findsOneWidget);
      expect(find.text(todo2Entity.state.description), findsOneWidget);
      expect(find.byIcon(todo2Entity.state.icon), findsOneWidget);
    }, timeout: const Timeout(Duration(seconds: 5)));
    testWidgets('TodosListView test', (tester) async {
      await tester.pumpWidget(wrap(child: TodosListView(TodoListBloc.toSortedMap([todo1Entity, todo2Entity]))));
      expect(find.text(todo1Entity.title), findsOneWidget);
      expect(find.text(todo1Entity.state.description), findsOneWidget);
      expect(find.byIcon(todo1Entity.state.icon), findsOneWidget);
      expect(find.text(todo2Entity.title), findsOneWidget);
      expect(find.text(todo2Entity.state.description), findsOneWidget);
      expect(find.byIcon(todo2Entity.state.icon), findsOneWidget);
      expect(find.text(dateFormat.format(todo1Entity.date)), findsOneWidget);
      expect(find.text(dateFormat.format(todo2Entity.date)), findsOneWidget);
    }, timeout: const Timeout(Duration(seconds: 5)));

    // test('', () async {}, timeout: const Timeout(Duration(seconds: 5)));
  });
  group('Выбор временного диапазона.', () {
    registerFallbackValue(DateRangeBlocStateFake());
    registerFallbackValue(DateRangeBlocEventFake());
    late MockDateRangeBloc mockDateRangeBloc;
    setUp(() {
      mockDateRangeBloc = MockDateRangeBloc();
      when(() => mockDateRangeBloc.state).thenReturn(const DateRangeBlocState(activeRangeIndex: 1));
    });
    tearDown(() async {
      await mockDateRangeBloc.close();
    });
    testWidgets('Должна быть только кнопка без popup', (tester) async {
      await tester.pumpWidget(wrap(child: const DateRangeSelectButton()));
      expect(find.byType(typeOf<PopupMenuButton<RadioListTile<DateRangeEnum>>>()), findsOneWidget);
      expect(find.byType(typeOf<PopupMenuItem<RadioListTile<DateRangeEnum>>>()), findsNothing);
      expect(find.byType(typeOf<RadioListTile<DateRangeEnum>>()), findsNothing);
    }, timeout: const Timeout(Duration(seconds: 5)));
    testWidgets('Нажали на кнопку, должно появится окошко с radio list', (tester) async {
      //  when(() => mockDateRangeBloc.state).thenReturn(const DateRangeBlocState(activeRangeIndex: 0));
      await tester.pumpWidget(
        BlocProvider<DateRangeBloc>.value(value: mockDateRangeBloc, child: wrap(child: const DateRangeSelectButton())),
      );
      await tester.tap(find.byType(typeOf<PopupMenuButton<RadioListTile<DateRangeEnum>>>()));
      await tester.pump();
      expect(find.byType(typeOf<PopupMenuItem<RadioListTile<DateRangeEnum>>>()), findsNWidgets(4));
      expect(find.byType(typeOf<RadioListTile<DateRangeEnum>>()), findsNWidgets(4));
      expect(find.text('На сегодня'), findsOneWidget);
    }, timeout: const Timeout(Duration(seconds: 5)));

    testWidgets('Нажали на кнопку, должно появится окошко с radio list. В окошко checked второй radio', (tester) async {
      // when(() => mockDateRangeBloc.state).thenReturn(const DateRangeBlocState(activeRangeIndex: 0));
      await tester.pumpWidget(
        BlocProvider<DateRangeBloc>.value(value: mockDateRangeBloc, child: wrap(child: const DateRangeSelectButton())),
      );
      await tester.tap(find.byType(typeOf<PopupMenuButton<RadioListTile<DateRangeEnum>>>()));
      await tester.pump(); //await tester.pump(const Duration(seconds: 1));
      final radioListTiles = find.descendant(
          of: find.byType(typeOf<PopupMenuItem<RadioListTile<DateRangeEnum>>>()),
          matching: find.byType(typeOf<RadioListTile<DateRangeEnum>>()));
      final radioListTileList = radioListTiles.evaluate().map((element) => element.widget as RadioListTile).toList();
      //
      expect(radioListTileList[0].checked, isFalse);
      expect(radioListTileList[1].checked, isTrue);
      expect(radioListTileList[2].checked, isFalse);
      expect(radioListTileList[3].checked, isFalse);
    }, timeout: const Timeout(Duration(seconds: 5)));
    testWidgets('Кликнем по третьему пункту. В bloc должно быть отправлено событие SetDateRangeBlocEvent',
        (tester) async {
      when(() => mockDateRangeBloc.state).thenReturn(const DateRangeBlocState(activeRangeIndex: 0));
      when(() => mockDateRangeBloc.add(any())).thenReturn(null);
      await tester.pumpWidget(
        BlocProvider<DateRangeBloc>.value(value: mockDateRangeBloc, child: wrap(child: const DateRangeSelectButton())),
      );
      await tester.tap(find.byType(typeOf<PopupMenuButton<RadioListTile<DateRangeEnum>>>()));
      await tester.pumpAndSettle();
      final radioListTiles = find.byType(typeOf<RadioListTile<DateRangeEnum>>());
      await tester.tap(radioListTiles.at(2));
      await tester.pumpAndSettle();
      verify(() => mockDateRangeBloc.add(const SetDateRangeBlocEvent(DateRangeEnum.Weekly))).called(1);
    }, timeout: const Timeout(Duration(seconds: 5)));
  });
}
