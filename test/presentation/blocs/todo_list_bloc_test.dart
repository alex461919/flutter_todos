// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/usecases/get_todo_list_usecase.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_list_screen/todo_list_bloc.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_list_screen/todo_list_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake_test_data.dart';

class MockGetTodoListUseCase extends Mock implements GetTodoListUseCase {}

class FakeGetTodoListUseCaseParams extends Fake implements GetTodoListUseCaseParams {}

void main() {
  late MockGetTodoListUseCase mockGetTodoListUseCase;
  late StreamController<List<TodoEntity>> todoStreamController;
  late TodoListBloc todoListBloc;

  final todosEntitiesMap = <DateTime, List<TodoEntity>>{
    DateTime(2021, 1, 1): [todo1Entity],
    DateTime(2021, 1, 2): [todo2Entity]
  };

  setUp(() {
    mockGetTodoListUseCase = MockGetTodoListUseCase();
    todoStreamController = StreamController<List<TodoEntity>>.broadcast();
    registerFallbackValue(FakeGetTodoListUseCaseParams());
    when(() => mockGetTodoListUseCase.call(any())).thenAnswer((_) => todoStreamController.stream);
    todoListBloc = TodoListBloc(
        mockGetTodoListUseCase, () => DateTimeRange(start: DateTime(2000, 1, 1), end: DateTime(2099, 1, 1)));
  });
  tearDown(() async {
    await todoStreamController.close();
    await todoListBloc.close();
  });
  group('Todo list screen bloc.', () {
    test('Начальное state должно быть Init, потока Pending', () {
      expect(todoListBloc.state, isA<InitTodoListBlocState>());
      expect(todoListBloc.stream, emits(isA<PendingTodoListBlocState>()));
    }, timeout: const Timeout(Duration(seconds: 5)));

    test('Запись во входящий поток и чтение состояния из потока bloc.', () {
      expect(
          todoListBloc.stream,
          emitsInOrder(<dynamic>[
            isA<PendingTodoListBlocState>(),
            isA<FulfilledTodoListBlocState>(),
          ]));
      Future.delayed(const Duration(milliseconds: 100), () => todoStreamController.add([todo2Entity, todo1Entity]));
    }, timeout: const Timeout(Duration(seconds: 5)));

    blocTest<TodoListBloc, TodoListBlocState>(
      'Запись во входящий поток и чтение состояния из потока bloc. Второй вариант.',
      build: () => todoListBloc,
      wait: const Duration(milliseconds: 2000),
      act: (_bloc) =>
          Future.delayed(const Duration(milliseconds: 100), () => todoStreamController.add([todo2Entity, todo1Entity])),
      expect: () => [
        isA<PendingTodoListBlocState>(),
        allOf([
          isA<FulfilledTodoListBlocState>(),
          predicate<FulfilledTodoListBlocState>((e) => e.get().toString() == todosEntitiesMap.toString())
        ]),
      ],
    );

    blocTest<TodoListBloc, TodoListBlocState>(
      'Запись ошибки во входящий поток',
      build: () => todoListBloc,
      wait: const Duration(milliseconds: 2000),
      act: (_bloc) => Future.delayed(
        const Duration(milliseconds: 100),
        () => todoStreamController.addError(Exception('blablabla')),
      ),
      expect: () => [
        isA<PendingTodoListBlocState>(),
        allOf([
          isA<RejectedTodoListBlocState>(),
          predicate<RejectedTodoListBlocState>((e) => e.get().toString() == 'Exception: blablabla')
        ]),
      ],
    );
    blocTest<TodoListBloc, TodoListBlocState>(
      'Запись ошибки во входящий поток. Вариант 2',
      build: () {
        when(() => mockGetTodoListUseCase.call(any())).thenAnswer((_) {
          Future.delayed(
              const Duration(milliseconds: 100), () => todoStreamController.addError(Exception('blablabla')));
          return todoStreamController.stream;
        });
        return todoListBloc;
      },
      wait: const Duration(milliseconds: 2000),
      expect: () => [
        isA<PendingTodoListBlocState>(),
        allOf([
          isA<RejectedTodoListBlocState>(),
          predicate<RejectedTodoListBlocState>((e) => e.get().toString() == 'Exception: blablabla')
        ]),
      ],
    );
    blocTest<TodoListBloc, TodoListBlocState>(
      'Запись во входящий поток и чтение состояния из потока bloc , потом ошибка. Вариант 3.',
      build: () {
        when(() => mockGetTodoListUseCase.call(any())).thenAnswer((_) {
          () async {
            await Future.delayed(
                const Duration(milliseconds: 100), () => todoStreamController.add([todo2Entity, todo1Entity]));
            await Future.delayed(
                const Duration(milliseconds: 100), () => todoStreamController.addError(Exception('blablabla')));
          }();
          return todoStreamController.stream;
        });
        return todoListBloc;
      },
      wait: const Duration(milliseconds: 2000),
      expect: () => [
        isA<PendingTodoListBlocState>(),
        allOf([
          isA<FulfilledTodoListBlocState>(),
          predicate<FulfilledTodoListBlocState>((e) => e.get().toString() == todosEntitiesMap.toString())
        ]),
        allOf([
          isA<RejectedTodoListBlocState>(),
          predicate<RejectedTodoListBlocState>((e) => e.get().toString() == 'Exception: blablabla')
        ]),
      ],
    );

    test('Проверка функции фильтра диапазона дат.', () {
      var range = () => DateTimeRange(start: DateTime(2021, 1, 1), end: DateTime(2021, 1, 1));
      expect(todoListBloc.whereParams(range).where(todo1Entity), isTrue);
      expect(todoListBloc.whereParams(range).where(todo2Entity), isFalse);
      range = () => DateTimeRange(start: DateTime(2021, 1, 2), end: DateTime(2021, 1, 2));
      expect(todoListBloc.whereParams(range).where(todo1Entity), isFalse);
      expect(todoListBloc.whereParams(range).where(todo2Entity), isTrue);
      range = () => DateTimeRange(start: DateTime(2020, 12, 31), end: DateTime(2021, 1, 3));
      expect(todoListBloc.whereParams(range).where(todo1Entity), isTrue);
      expect(todoListBloc.whereParams(range).where(todo2Entity), isTrue);
      range = () => DateTimeRange(start: DateTime(2021, 1, 20), end: DateTime(2021, 1, 21));
      expect(todoListBloc.whereParams(range).where(todo1Entity), isFalse);
      expect(todoListBloc.whereParams(range).where(todo2Entity), isFalse);
      //
    }, timeout: const Timeout(Duration(seconds: 5)));
  });
}
