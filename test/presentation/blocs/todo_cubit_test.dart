import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/domain/entities/state_entity.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/usecases/delete_todo_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/get_sate_list_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/get_todo_list_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/update_todo_usecase.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_screen/todo_cubit.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_screen/todo_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake_test_data.dart';

class MockGetTodoListUseCase extends Mock implements GetTodoListUseCase {}

class MockGetStateListUseCase extends Mock implements GetStateListUseCase {}

class MockUpdateTodoUseCase extends Mock implements UpdateTodoUseCase {}

class MockDeleteTodoUseCase extends Mock implements DeleteTodoUseCase {}

class FakeGetTodoListUseCaseParams extends Fake implements GetTodoListUseCaseParams {}

class FakeUpdateTodoUseCaseParams extends Fake implements UpdateTodoUseCaseParams {}

class FakeDeleteTodoUseCaseParams extends Fake implements DeleteTodoUseCaseParams {}

void main() {
  late MockGetTodoListUseCase mockGetTodoListUseCase;
  late MockGetStateListUseCase mockGetStateListUseCase;
  late MockUpdateTodoUseCase mockUpdateTodoUseCase;
  late MockDeleteTodoUseCase mockDeleteTodoUseCase;
  late StreamController<List<TodoEntity>> todoStreamController;

  final stateEntityList = <StateEntity>[state1Entity, state2Entity];

  setUp(() {
    mockGetTodoListUseCase = MockGetTodoListUseCase();
    mockGetStateListUseCase = MockGetStateListUseCase();
    mockUpdateTodoUseCase = MockUpdateTodoUseCase();
    mockDeleteTodoUseCase = MockDeleteTodoUseCase();

    todoStreamController = StreamController<List<TodoEntity>>.broadcast();
    when(() => mockGetStateListUseCase.call()).thenAnswer((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 100));
      return stateEntityList;
    });

    registerFallbackValue(FakeGetTodoListUseCaseParams());
    when(() => mockGetTodoListUseCase.call(any())).thenAnswer((_) => todoStreamController.stream);
    registerFallbackValue(FakeDeleteTodoUseCaseParams());
    registerFallbackValue(FakeUpdateTodoUseCaseParams());
  });
  tearDown(() async {
    await todoStreamController.close();
  });
  group('Todo screen cubit.', () {
    test('Начальное state cubit должно быть Pending', () async {
      final todoCubit =
          TodoCubit(mockGetTodoListUseCase, mockGetStateListUseCase, mockUpdateTodoUseCase, mockDeleteTodoUseCase, '1');
      await expectLater(todoCubit.state.process, Process.pending);
      await todoCubit.close();
    }, timeout: const Timeout(Duration(seconds: 2)));
    group('Запись во входящий поток и чтение состояния кубита.', () {
      blocTest<TodoCubit, TodoCubitState>(
        'Запишем во входной поток todo c id 1. В state должена быть todo с id 1',
        wait: const Duration(milliseconds: 2000),
        build: () {
          return TodoCubit(
              mockGetTodoListUseCase, mockGetStateListUseCase, mockUpdateTodoUseCase, mockDeleteTodoUseCase, '1');
        },
        act: (cubit) async {
          await Future.delayed(const Duration(milliseconds: 50), () => todoStreamController.add([todo1Entity]));
        },
        expect: () => [
          allOf([
            predicate<TodoCubitState>((e) => e.process == Process.fulfilled),
            predicate<TodoCubitState>((e) => e.todo == todo1Entity),
            predicate<TodoCubitState>((e) => e.stateList == stateEntityList),
          ]),
        ],
      );
      blocTest<TodoCubit, TodoCubitState>(
        'Запишем во входной поток todo c id 2. Должны получить ошибку.',
        wait: const Duration(milliseconds: 2000),
        build: () {
          return TodoCubit(
              mockGetTodoListUseCase, mockGetStateListUseCase, mockUpdateTodoUseCase, mockDeleteTodoUseCase, '1');
        },
        act: (cubit) async {
          await Future.delayed(const Duration(milliseconds: 50), () => todoStreamController.add([todo2Entity]));
        },
        expect: () => [
          allOf([
            predicate<TodoCubitState>((e) => e.process == Process.reject),
            predicate<TodoCubitState>((e) => e.exception is Exception),
          ])
        ],
      );
    });
    group('Действия Update & delete.', () {
      blocTest<TodoCubit, TodoCubitState>(
        'Изменение todo c id 1. Ошибки быть не должно',
        wait: const Duration(milliseconds: 2000),
        build: () {
          when(() => mockUpdateTodoUseCase.call(any()))
              .thenAnswer((_) => Future.delayed(const Duration(milliseconds: 100)));
          return TodoCubit(
              mockGetTodoListUseCase, mockGetStateListUseCase, mockUpdateTodoUseCase, mockDeleteTodoUseCase, '1');
        },
        act: (cubit) => Future.delayed(
            const Duration(milliseconds: 50), () => cubit.updateTodo(todo1Entity.copyWith(title: 'Title_changed'))),
        verify: (cubit) {
          verify(() =>
                  mockUpdateTodoUseCase.call(UpdateTodoUseCaseParams(todo1Entity.copyWith(title: 'Title_changed'))))
              .called(1);
        },
      );

      blocTest<TodoCubit, TodoCubitState>(
        'Изменение todo c id 1. Должна вернуться ошибка',
        wait: const Duration(milliseconds: 2000),
        build: () {
          when(() => mockUpdateTodoUseCase.call(any())).thenThrow(Exception('blablabla'));
          // when(() => mockUpdateTodoUseCase.call(any())).thenAnswer((_) => Future.error(Exception('blablabla')));
          return TodoCubit(
              mockGetTodoListUseCase, mockGetStateListUseCase, mockUpdateTodoUseCase, mockDeleteTodoUseCase, '1');
        },
        act: (cubit) => Future.delayed(const Duration(milliseconds: 50), () => cubit.updateTodo(todo1Entity)),
        expect: () => [
          predicate<TodoCubitState>((e) => e.process == Process.update),
          allOf([
            predicate<TodoCubitState>((e) => e.process == Process.reject),
            predicate<TodoCubitState>(
                (e) => e.exception is Exception && e.exception.toString() == 'Exception: blablabla'),
          ]),
        ],
      );
      blocTest<TodoCubit, TodoCubitState>(
        'Удаление todo c id 1. Ошибки быть не должно',
        wait: const Duration(milliseconds: 2000),
        build: () {
          when(() => mockDeleteTodoUseCase.call(any()))
              .thenAnswer((_) => Future.delayed(const Duration(milliseconds: 100)));
          return TodoCubit(
              mockGetTodoListUseCase, mockGetStateListUseCase, mockUpdateTodoUseCase, mockDeleteTodoUseCase, '1');
        },
        act: (cubit) => Future.delayed(const Duration(milliseconds: 50), () => cubit.deleteTodo(todo1Entity)),
        verify: (cubit) {
          verify(() => mockDeleteTodoUseCase.call(DeleteTodoUseCaseParams(todo1Entity))).called(1);
        },
      );
      blocTest<TodoCubit, TodoCubitState>(
        'Удаление todo c id 1. Должна вернуться ошибка',
        wait: const Duration(milliseconds: 2000),
        build: () {
          when(() => mockDeleteTodoUseCase.call(any())).thenThrow(Exception('blablabla'));
          return TodoCubit(
              mockGetTodoListUseCase, mockGetStateListUseCase, mockUpdateTodoUseCase, mockDeleteTodoUseCase, '1');
        },
        act: (cubit) => Future.delayed(const Duration(milliseconds: 50), () => cubit.deleteTodo(todo1Entity)),
        expect: () => [
          predicate<TodoCubitState>((e) => e.process == Process.delete),
          allOf([
            predicate<TodoCubitState>((e) => e.process == Process.reject),
            predicate<TodoCubitState>(
                (e) => e.exception is Exception && e.exception.toString() == 'Exception: blablabla'),
          ]),
        ],
      );
    });
  });
}
