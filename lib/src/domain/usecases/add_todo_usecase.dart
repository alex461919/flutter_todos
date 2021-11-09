import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/repositories/todos_repository.dart';
import 'package:flutter_todos/src/domain/usecases/usecase.dart';

class AddTodoUseCase extends UseCase<Future<void>, AddTodoUseCaseParams> {
  final TodosRepository todosRepository;
  AddTodoUseCase(this.todosRepository);

  @override
  Future<void> call(AddTodoUseCaseParams params) => todosRepository.addTodo(params.todo);
}

class AddTodoUseCaseParams {
  final TodoEntity todo;
  AddTodoUseCaseParams(this.todo);
}
