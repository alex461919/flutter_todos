import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/domain/repositories/todos_repository.dart';
import 'package:flutter_todos/src/domain/usecases/get_sate_list_usecase.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_add_screen/todo_add_state.dart';

class TodoAddCubit extends Cubit<TodoAddCubitState> {
  //
  final TodosRepository _todosRepository;
  final GetStateListUseCase _getStateListUseCase;

  TodoAddCubit(
    this._getStateListUseCase,
    this._todosRepository,
  ) : super(const InitTodoAddCubitState());

  Future<void> addTodo({required String title, required DateTime date, String? note}) async {
    emit(const PendingTodoAddCubitState());
    try {
      final stateList = await _getStateListUseCase.call();
      assert(stateList.isNotEmpty, 'Empty state list');
      await _todosRepository.addTodo(TodoEntity(title: title, note: note, date: date, state: stateList[0]));
      emit(const FulfilledTodoAddBlocState());
    } on Exception catch (error) {
      emit(RejectedTodoAddBlocState(error));
    }
  }
}
