import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/data/datasources/todos_datasource.dart';
import 'package:flutter_todos/src/data/mappers/todos_data_mappers.dart';
import 'package:flutter_todos/src/data/models/state_model.dart';
import 'package:flutter_todos/src/data/models/todo_model.dart';
import 'package:flutter_todos/src/data/todos_data_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rxdart/rxdart.dart';

import '../fake_test_data.dart';

class MockTodosDataSource extends Mock implements TodosDataSource {}

void main() {
  group('todos data repository impl test.', () {
    late TodosDataRepositoryImpl todosDataRepositoryImpl;
    late MockTodosDataSource mockTodosDataSource;
    late BehaviorSubject<List<StateModel>> stateSubject;
    late BehaviorSubject<List<TodoModel>> todoSubject;

    setUp(() {
      mockTodosDataSource = MockTodosDataSource();
      todosDataRepositoryImpl = TodosDataRepositoryImpl(mockTodosDataSource, DataRepositoryMapper());
      stateSubject = BehaviorSubject<List<StateModel>>();
      todoSubject = BehaviorSubject<List<TodoModel>>();
      when(() => mockTodosDataSource.getStateList()).thenAnswer((_) => stateSubject.stream);
      when(() => mockTodosDataSource.getTodoList()).thenAnswer((_) => todoSubject.stream);
    });
    tearDown(() async {
      await stateSubject.close();
      await todoSubject.close();
    });
    group('getStateList.', () {
      test('Один статус закинули и считали. Значение должно совпасть.', () async {
        final stateList = todosDataRepositoryImpl.getStateList();
        stateSubject.add([state1Model]);
        expect(await stateList.first, equals([state1Entity]));
      });
      test('Последовательно два статуса закинулии и считали. Значения должны совпасть.', () {
        final stateList = todosDataRepositoryImpl.getStateList();
        expect(
            stateList,
            emitsInOrder(<dynamic>[
              [state1Entity],
              [state2Entity]
            ]));
        stateSubject
          ..add([state1Model])
          ..add([state2Model]);
      });
    });

    group('getTodoList.', () {
      test('Один статус закинулии считали. Значение должно совпасть.', () async {
        final todoList = todosDataRepositoryImpl.getTodoList();
        stateSubject.add([state1Model]);
        todoSubject.add([todo1Model]);
        expect(await todoList.first, equals([todo1Entity]));
      });
      test('Закинулии статуса и todo в разной последовательности. Значения должны совпасть.', () async {
        final todoList = todosDataRepositoryImpl.getTodoList();
        expect(
            todoList,
            emitsInOrder(<dynamic>[
              [todo1Entity],
              [todo1Entity.copyWith(state: state2Entity)],
              [todo2Entity],
              [todo2Entity, todo1Entity],
            ]));

        stateSubject.add([state1Model]);
        todoSubject.add([todo1Model]);
        stateSubject.add([state1Model, state2Model]);
        todoSubject
          ..add([todo1Model.copyWith(state: '2')])
          ..add([todo2Model])
          ..add([todo2Model, todo1Model]);
      });

      test('Закинулии todo с неизвестным статусом. Должна выкинуться ошибка с Exception.', () {
        final todoList = todosDataRepositoryImpl.getTodoList();
        expect(todoList, emitsError(isA<Exception>()));
        stateSubject.add([]);
        todoSubject.add([todo1Model]);
      });
      test('если из TodosDataSource прилетела ошибка, то должны ее поймать.', () {
        final todoList = todosDataRepositoryImpl.getTodoList();
        expect(
            todoList,
            emitsInOrder(<dynamic>[
              emitsError(predicate((e) => e.toString() == 'Exception: blablabla')),
              emitsError('blablabla'),
            ]));
        stateSubject.add([]);
        todoSubject
          ..addError(Exception('blablabla'))
          ..addError('blablabla');
      });
    });
    test('addTodo вернет exception', () {
      when(() => mockTodosDataSource.addTodo(todo1Model)).thenAnswer((_) {
        throw Exception('blablabla');
      });
      expect(() => todosDataRepositoryImpl.addTodo(todo1Entity),
          throwsA(predicate((e) => e.toString() == 'Exception: blablabla')));
      verify(() => mockTodosDataSource.addTodo(todo1Model));
    });
    test('addTodo без exception', () {
      when(() => mockTodosDataSource.addTodo(todo1Model)).thenAnswer((_) async {});
      expect(todosDataRepositoryImpl.addTodo(todo1Entity), completes);
      verify(() => mockTodosDataSource.addTodo(todo1Model));
    });
    test('updateTodo вернет exception', () {
      when(() => mockTodosDataSource.updateTodo(todo1Model)).thenAnswer((_) {
        throw Exception('blablabla');
      });
      expect(() => todosDataRepositoryImpl.updateTodo(todo1Entity),
          throwsA(predicate((e) => e.toString() == 'Exception: blablabla')));
      verify(() => mockTodosDataSource.updateTodo(todo1Model));
    });
    test('updateTodo без exception', () {
      when(() => mockTodosDataSource.updateTodo(todo1Model)).thenAnswer((_) async {});
      expect(todosDataRepositoryImpl.updateTodo(todo1Entity), completes);
      verify(() => mockTodosDataSource.updateTodo(todo1Model));
    });
    test('deleteTodo вернет exception', () {
      when(() => mockTodosDataSource.deleteTodo(todo1Model)).thenAnswer((_) {
        throw Exception('blablabla');
      });
      expect(() => todosDataRepositoryImpl.deleteTodo(todo1Entity),
          throwsA(predicate((e) => e.toString() == 'Exception: blablabla')));
      verify(() => mockTodosDataSource.deleteTodo(todo1Model));
    });
    test('deleteTodo без exception', () {
      when(() => mockTodosDataSource.deleteTodo(todo1Model)).thenAnswer((_) async {});
      expect(todosDataRepositoryImpl.deleteTodo(todo1Entity), completes);
      verify(() => mockTodosDataSource.deleteTodo(todo1Model));
    });
  });
}
