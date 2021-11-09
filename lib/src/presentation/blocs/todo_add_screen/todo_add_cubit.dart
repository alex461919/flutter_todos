import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/repositories/todos_repository.dart';
import 'package:flutter_todos/src/domain/usecases/get_sate_list_usecase.dart';

class TodoAddCubit extends Cubit<void> {
  //
  final TodosRepository _todosRepository;
  final GetStateListUseCase _getStateListUseCase;

  TodoAddCubit(
    this._getStateListUseCase,
    this._todosRepository,
  ) : super(null);

  Future<void> addTodo({required String title, String? note, required DateTime date}) async {
    final stateList = await _getStateListUseCase.call();
    assert(stateList.isNotEmpty, 'Empty state list');
    return _todosRepository.addTodo(TodoEntity(title: title, note: note, date: date, state: stateList[0]));
  }
}
