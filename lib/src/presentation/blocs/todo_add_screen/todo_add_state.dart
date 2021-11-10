abstract class TodoAddCubitState {
  const TodoAddCubitState();
}

class InitTodoAddCubitState extends TodoAddCubitState {
  const InitTodoAddCubitState();
}

class PendingTodoAddCubitState extends TodoAddCubitState {
  const PendingTodoAddCubitState();
}

class FulfilledTodoAddBlocState extends TodoAddCubitState {
  const FulfilledTodoAddBlocState();
}

class RejectedTodoAddBlocState extends TodoAddCubitState {
  final Exception exception;
  const RejectedTodoAddBlocState(this.exception);
  Exception get() => exception;
}
