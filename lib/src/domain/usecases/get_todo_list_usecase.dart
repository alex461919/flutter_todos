import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/repositories/todos_repository.dart';
import 'package:flutter_todos/src/domain/usecases/usecase.dart';

class GetTodoListUseCase extends UseCase<Stream<List<TodoEntity>>, GetTodoListUseCaseParams> {
  final TodosRepository todosRepository;
  GetTodoListUseCase(this.todosRepository);

  @override
  Stream<List<TodoEntity>> call(GetTodoListUseCaseParams params) {
    final stream = todosRepository.getTodoList();
    return stream.map((event) => event.where(params.where).toList());
  }
}

class GetTodoListUseCaseParams {
  final bool Function(TodoEntity) where;
  GetTodoListUseCaseParams(this.where);
}
