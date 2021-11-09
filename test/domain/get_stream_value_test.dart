import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/src/domain/usecases/get_stream_value.dart';

void main() {
  group('get stream value test.', () {
    late StreamController<int> controller;
    setUp(() {
      controller = StreamController<int>.broadcast();
    });
    tearDown(() async {
      await controller.close();
    });
    test('Ждем событие из потока(без его закрытия) выдаем его  . Или последнее значение, если поток - BehaviorSubject.',
        () async {
      controller.add(1);
      final future = getStreamValue(controller.stream);
      controller.add(2);
      expect(future, completion(2));
    });

    test('Должны получить ошибку.', () async {
      final future = getStreamValue(controller.stream);
      controller.addError(Exception('blablabla'));
      expect(future, throwsA(predicate((e) => e.toString() == 'Exception: blablabla')));
    });
  });
}
