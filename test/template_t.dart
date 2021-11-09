import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/domain/usecases/get_todo_list_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockTodosRepository extends Mock implements GetTodoListUseCase {}

void main() {
  setUp(() {});
  tearDown(() async {});
  group('', () {
    test('', () async {}, timeout: const Timeout(Duration(seconds: 5)));
  });
}
