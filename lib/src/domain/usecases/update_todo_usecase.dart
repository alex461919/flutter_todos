import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/repositories/todos_repository.dart';
import 'package:flutter_todos/src/domain/usecases/usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_todo_usecase.freezed.dart';

class UpdateTodoUseCase extends UseCase<Future<void>, UpdateTodoUseCaseParams> {
  final TodosRepository todosRepository;
  UpdateTodoUseCase(this.todosRepository);

  @override
  Future<void> call(UpdateTodoUseCaseParams params) => todosRepository.updateTodo(params.todo);
}

@freezed
class UpdateTodoUseCaseParams with _$UpdateTodoUseCaseParams {
  const factory UpdateTodoUseCaseParams(TodoEntity todo) = _UpdateTodoUseCaseParams;
}
