import 'package:flutter_todos/src/domain/entities/state_entity.dart';
import 'package:flutter_todos/src/domain/repositories/todos_repository.dart';
import 'package:flutter_todos/src/domain/usecases/get_stream_value.dart';
import 'package:flutter_todos/src/domain/usecases/usecase.dart';

class GetStateListUseCase extends UseCase<Future<List<StateEntity>>, void> {
  final TodosRepository todosRepository;
  GetStateListUseCase(this.todosRepository);

  @override
  Future<List<StateEntity>> call([void params]) => getStreamValue(todosRepository.getStateList());
}
