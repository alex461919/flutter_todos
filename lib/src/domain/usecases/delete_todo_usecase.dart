import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/repositories/todos_repository.dart';
import 'package:flutter_todos/src/domain/usecases/usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_todo_usecase.freezed.dart';

class DeleteTodoUseCase extends UseCase<Future<void>, DeleteTodoUseCaseParams> {
  final TodosRepository todosRepository;
  DeleteTodoUseCase(this.todosRepository);

  @override
  Future<void> call(DeleteTodoUseCaseParams params) => todosRepository.deleteTodo(params.todo);
}

@freezed
class DeleteTodoUseCaseParams with _$DeleteTodoUseCaseParams {
  const factory DeleteTodoUseCaseParams(TodoEntity todo) = _DeleteTodoUseCaseParams;
}
