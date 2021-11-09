import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/data/mappers/todos_data_mappers.dart';

import '../fake_test_data.dart';

void main() {
  group('todos data mappers test.', () {
    final dataMapper = DataRepositoryMapper();
    group('State.', () {
      test('Значения должны совпасть.', () {
        expect(dataMapper.mapStateToEntity(state1Model), equals(state1Entity));
        expect(dataMapper.mapStateFromEntity(state1Entity), equals(state1Model));
      });
    });
    group('Todo.', () {
      test('Значения должны совпасть.', () {
        expect(dataMapper.mapTodoToEntity(todo1Model, [state1Model, state2Model]), equals(todo1Entity));
        expect(dataMapper.mapTodoToEntity(todo1Model.copyWith(state: '2'), [state1Model, state2Model]),
            equals(todo1Entity.copyWith(state: state2Entity)));
        expect(dataMapper.mapTodoFromEntity(todo1Entity), equals(todo1Model));
      });
      test('Нет такого статуса. Должно выбросить exception.', () {
        expect(() => dataMapper.mapTodoToEntity(todo1Model.copyWith(state: '12'), [state1Model, state2Model]),
            throwsException);
      });
    });
  });
}
