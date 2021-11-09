import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todos/src/domain/entities/todo_entity.dart';
import 'package:flutter_todos/src/injector.dart';
import 'package:flutter_todos/src/mix/util.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc_event.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc_state.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_list_screen/todo_list_bloc.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_list_screen/todo_list_state.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class MaterialTodoListPage extends StatelessWidget implements AutoRouteWrapper {
  const MaterialTodoListPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return TodoListBlocProviderWrapper(
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<DateRangeBloc>(context, listen: true).state.activeRange.title),
        leading: const DateRangeSelectButton(),
      ),
      body: Center(
        child: BlocBuilder<TodoListBloc, TodoListBlocState>(
          builder: (context, state) {
            assert(
                state is InitTodoListBlocState ||
                    state is PendingTodoListBlocState ||
                    state is FulfilledTodoListBlocState ||
                    state is RejectedTodoListBlocState,
                'Unknown TodoListBlocState: ${state.runtimeType}');

            if (state is RejectedTodoListBlocState) {
              return Text(state.get().toString());
            }
            if (state is FulfilledTodoListBlocState) {
              return TodosListView(state.get());
            }
            return const WaitIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).navigateNamed('/add');
        },
        tooltip: 'Новое задание',
        child: const Icon(Icons.add, size: 28.0),
      ),
    );
  }
}

class TodoListBlocProviderWrapper extends HookWidget {
  const TodoListBlocProviderWrapper({Key? key, Widget? child})
      : _child = child,
        super(key: key);

  final Widget? _child;

  @override
  Widget build(BuildContext context) {
    final activeRange = Provider.of<DateRangeBloc>(context, listen: true).state.activeRange;
    final todoListBlocState = useState<TodoListBloc?>(null);

    useEffect(() {
      final _todoListBlocState = todoListBlocState.value = TodoListBloc(injector(), activeRange.rangeFn);
      return _todoListBlocState.close;
    }, [activeRange]);
    return BlocProvider.value(value: todoListBlocState.value!, child: _child);
  }
}

class DateRangeSelectButton extends StatelessWidget {
  const DateRangeSelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<RadioListTile<DateRangeEnum>>(
      icon: const Icon(Icons.menu),
      offset: Offset.fromDirection(0.7853, 64.0),
      itemBuilder: (context) => [
        for (DateRangeEnum item in Provider.of<DateRangeBloc>(context, listen: false).state.dateRangeList)
          PopupMenuItem(
            child: Builder(
              builder: (context) {
                final bloc = Provider.of<DateRangeBloc>(context, listen: true);
                return RadioListTile(
                  title: Text(item.value.title),
                  value: item,
                  groupValue: bloc.state.activeRangeEnum,
                  onChanged: (val) {
                    Navigator.pop(context);
                    if (val != null) bloc.add(SetDateRangeBlocEvent(val as DateRangeEnum));
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}

class TodosListView extends StatelessWidget {
  const TodosListView(this._todos, {Key? key}) : super(key: key);

  final Map<DateTime, List<TodoEntity>> _todos;

  @override
  Widget build(BuildContext context) {
    final dateList = _todos.keys.toList();
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dateList.length,
        itemBuilder: (context, index) {
          final todoList = _todos[dateList[index]];
          return [
            Text(
              DateFormat.yMMMMEEEEd('ru_RU').format(dateList[index]),
              style: Theme.of(context).textTheme.headline6,
            ),
            DayItem(todoList),
          ].toColumn(mainAxisSize: MainAxisSize.min);
        });
  }
}

class DayItem extends StatelessWidget {
  const DayItem(List<TodoEntity>? list, {Key? key})
      : _list = list ?? const [],
        super(key: key);
  final List<TodoEntity> _list;

  @override
  Widget build(BuildContext context) => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        separatorBuilder: (context, index) => const Divider(
          height: 1,
        ),
        shrinkWrap: true,
        itemCount: _list.length,
        itemBuilder: (context, index) => TodoItem(
          _list[index],
          onTap: () {
            AutoRouter.of(context).navigateNamed('/${_list[index].id}/detail');
          },
        ),
      );
}

class TodoItem extends StatelessWidget {
  const TodoItem(this._todo, {Key? key, void Function()? onTap})
      : _onTap = onTap,
        super(key: key);
  final void Function()? _onTap;
  final TodoEntity _todo;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_todo.title).padding(top: 8),
      leading: Icon(_todo.state.icon, color: _todo.state.color, size: 30.0, semanticLabel: _todo.state.description),
      subtitle: Text(_todo.state.description).fontSize(10).padding(top: 4, bottom: 8),
      onTap: _onTap,
    ).opacity(_todo.state.opacity);
  }
}
