import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/domain/entities/state_entity.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/repositories/todos_repository.dart';
import 'package:flutter_todos/src/domain/usecases/get_sate_list_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/get_todo_list_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../fake_test_data.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  late MockTodosRepository mockTodosRepository;
  late StreamController<List<StateEntity>> stateStreamController;
  late StreamController<List<TodoEntity>> todoStreamController;

  setUp(() {
    mockTodosRepository = MockTodosRepository();
    stateStreamController = StreamController<List<StateEntity>>.broadcast();
    todoStreamController = StreamController<List<TodoEntity>>.broadcast();
    when(() => mockTodosRepository.getStateList()).thenAnswer((_) => stateStreamController.stream);
    when(() => mockTodosRepository.getTodoList()).thenAnswer((_) => todoStreamController.stream);
  });
  tearDown(() async {
    await stateStreamController.close();
    await todoStreamController.close();
  });
  group('usecases test. getStateList.', () {
    test('Простая проверка. Записали-получили', () {
      final getStateListUseCase = GetStateListUseCase(mockTodosRepository);
      getStateListUseCase.call().then(expectAsync1((e) {
        expect(e, [state1Entity]);
      }));
      stateStreamController.add([state1Entity]);
    });
  });
  group('usecases test.getTodoList.', () {
    test('Простая проверка. Записали-получили', () async {
      final getTodoListUseCase = GetTodoListUseCase(mockTodosRepository);
      expect(getTodoListUseCase.call(GetTodoListUseCaseParams((_) => true)), emits([todo1Entity]));
      todoStreamController.add([todo1Entity]);
    });
    test('Проверка на ошибку. Записали-получили', () async {
      final getTodoListUseCase = GetTodoListUseCase(mockTodosRepository);
      getTodoListUseCase.call(GetTodoListUseCaseParams((_) => true)).listen(null, onError: expectAsync1((e) {
        expect(e, predicate((e) => e.toString() == 'Exception: blablabla'));
      }));
      todoStreamController.addError(Exception('blablabla'));
    });
    test('Проверка выборки с условием.', () async {
      final getTodoListUseCase = GetTodoListUseCase(mockTodosRepository);
      bool where(TodoEntity todo) => todo.date.isBefore(DateTime(2021, 1, 2));
      expect(getTodoListUseCase.call(GetTodoListUseCaseParams(where)), emits([todo1Entity]));
      todoStreamController.add([todo1Entity, todo2Entity]);
    });
  });
}
