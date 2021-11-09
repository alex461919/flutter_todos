import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todos/main.gr.dart';
import 'package:flutter_todos/src/domain/entities/state_entity.dart';
import 'package:flutter_todos/src/injector.dart';
import 'package:flutter_todos/src/mix/logger.dart';
import 'package:flutter_todos/src/mix/util.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_screen/todo_cubit.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_screen/todo_state.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

class MaterialTodoPage extends StatelessWidget implements AutoRouteWrapper {
  const MaterialTodoPage({
    @PathParam('id') required String id,
    Key? key,
  })  : _id = id,
        super(key: key);
  final String _id;

  @override
  Widget wrappedRoute(BuildContext context) {
    return TodoBlocProviderWrapper(
      id: _id,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) => AutoTabsRouter(
          routes: const [
            DetailTab(),
            EditTab(),
            StateEditTab(),
            DeleteTab(),
          ],
          builder: (context, child, animation) => Scaffold(
                //
                appBar: AppBar(
                  title: Text(titleByRouteName(AutoTabsRouter.of(context).currentChild!.name)),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      if (context.router.stackData.length == 1) {
                        context.router.replaceNamed('/');
                      } else {
                        context.router.popUntilRoot();
                      }
                    },
                  ),
                ),
                body: FadeTransition(
                  opacity: animation,
                  child: BlocConsumer<TodoCubit, TodoCubitState>(
                      listenWhen: (previous, current) =>
                          current.process == Process.reject ||
                          current.process == Process.dispose ||
                          (current.process == Process.fulfilled &&
                              (previous.process == Process.update || previous.process == Process.delete)),
                      listener: (context, state) {
                        if (state.process == Process.reject) {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            barrierColor: Colors.white54,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Ошибка!'),
                                content: Text(state.exception.toString()).textColor(Theme.of(context).errorColor),
                                actions: [
                                  TextButton(
                                    child: const Text('ПОНЯЛ'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (state.process == Process.dispose) {
                          if (context.router.stackData.length == 1) {
                            context.router.replaceNamed('/');
                          } else {
                            context.router.popUntilRoot();
                          }
                        } else if (state.process == Process.fulfilled) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Успешно')));
                        }
                      },
                      builder: (context, state) {                        
                        return [
                          child,
                          if (state.process == Process.pending ||
                              state.process == Process.delete ||
                              state.process == Process.update) ...[const WaitIndicator().center()],
                        ].toStack();
                      }),
                  //
                ),
                bottomNavigationBar: bottomNavigationBar(context),
              ));

  BottomNavigationBar bottomNavigationBar(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.details),
          label: 'Detail',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Edit',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.checklist),
          label: 'State',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.clear),
          label: 'Delete',
        ),
      ],
    );
  }
}

String titleByRouteName(String name) {
  switch (name) {
    case 'DetailTab':
      return 'Подробности задания';
    case 'EditTab':
      return 'Редактировать задачу';
    case 'StateEditTab':
      return 'Изменить статус задачи';
    case 'DeleteTab':
      return 'Удалить задачу';
    default:
      assert(false, 'Unknown route name: $name');
      return '';
  }
}

class TodoBlocProviderWrapper extends HookWidget {
  const TodoBlocProviderWrapper({required String id, Widget? child, Key? key})
      : _id = id,
        _child = child,
        super(key: key);
  final Widget? _child;
  final String _id;

  @override
  Widget build(BuildContext context) {
    final todoBlocState = useState<TodoCubit?>(null);

    useEffect(() {
      final _todoBlocState = todoBlocState.value = TodoCubit(injector(), injector(), injector(), injector(), _id);
      return _todoBlocState.close;
    }, [_id]);
    return BlocProvider.value(value: todoBlocState.value!, child: _child);
  }
}

class MaterialTodoDetailWidget extends StatelessWidget {
  const MaterialTodoDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<TodoCubit>(context, listen: true).state;
    if (state.todo == null) return const Text('');
    final todo = state.todo!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: [
        Text(todo.title).textStyle(Theme.of(context).textTheme.headline6!).padding(bottom: 16),
        if (todo.note != null) ...[
          const Text('Дополнительно:').padding(vertical: 8),
          Text(todo.note!).padding(vertical: 8)
        ],
        const Text('Дата:').padding(vertical: 8),
        Text(DateFormat.yMMMMEEEEd('ru_RU').format(todo.date)).padding(vertical: 8),
        const Text('Статус:').padding(vertical: 8),
        [
          Icon(todo.state.icon, color: todo.state.color, size: 30.0, semanticLabel: todo.state.description),
          Text(todo.state.description).textColor(todo.state.color).padding(left: 16),
        ].toRow(mainAxisSize: MainAxisSize.min).padding(top: 8),
      ].toColumn(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start),
    ).center(); //.padding(all: 16);
  }
}

class MaterialTodoEditWidget extends HookWidget {
  const MaterialTodoEditWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<TodoCubit>(context, listen: true).state;
    if (state.todo == null) return const Text('');
    final todo = state.todo!;
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    String? _title;
    String? _note;
    DateTime? _date;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: [
          TextFormField(
            initialValue: todo.title,
            maxLines: null,
            onSaved: (val) {
              _title = val;
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Заполните текст задания';
            },
            decoration: const InputDecoration(labelText: 'Текст задания'),
          ).padding(vertical: 8),
          TextFormField(
            initialValue: todo.note,
            maxLines: null,
            onSaved: (val) {
              _note = val;
            },
            decoration: const InputDecoration(labelText: 'Дополнительно'),
          ).padding(vertical: 8),
          DateTimeField(
            initialValue: todo.date,
            format: DateFormat.yMMMMEEEEd('ru_RU'),
            decoration: const InputDecoration(labelText: 'Дата'),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  locale: const Locale('ru', 'RU'),
                  context: context,
                  firstDate: DateTime.now(),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: todayPlus(30));
            },
            onSaved: (val) {
              _date = val;
            },
            validator: (value) {
              if (value == null) return 'Выберите дату';
            },
          ).padding(vertical: 8),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                BlocProvider.of<TodoCubit>(context, listen: false).updateTodo(
                  todo.copyWith(title: _title!, note: _note, date: _date!),
                );
              }
            },
            child: const Text('СОХРАНИТЬ'),
          ).alignment(Alignment.centerRight).padding(top: 32),
        ].toColumn(),
      ),
    ).center();
  }
}

class MaterialStateEditWidget extends HookWidget {
  const MaterialStateEditWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<TodoCubit>(context, listen: true).state;
    if (state.todo == null || state.stateList == null) return const Text('');
    final todo = state.todo!;
    final stateList = state.stateList!;
    final currnetState = useState(todo.state);
    return [
      SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: [
          ...stateList.map(
            (item) => RadioListTile(
              title: Text(item.description),
              secondary: Icon(item.icon, color: item.color, size: 30.0, semanticLabel: item.description),
              value: item,
              groupValue: currnetState.value,
              onChanged: (val) {
                if (val != null) currnetState.value = val as StateEntity;
              },
            ).padding(vertical: 8).constrained(maxWidth: 360),
          ),
        ].toColumn(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start),
      ).center(),
      FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          BlocProvider.of<TodoCubit>(context, listen: false).updateTodo(todo.copyWith(state: currnetState.value));
        },
        tooltip: 'Сохранить',
        child: const Icon(Icons.save_alt, size: 28.0),
      ).positioned(right: 16, bottom: 16),
    ].toStack();
  }
}

class MaterialTodoDeleteWidget extends StatelessWidget {
  const MaterialTodoDeleteWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<TodoCubit>(context, listen: true).state;
    if (state.todo == null) return const Text('');
    final todo = state.todo!;
    return AlertDialog(
      title: Text(todo.title),
      content: const Text('Вы действительно хотите удалить задачу?'),
      actions: [
        TextButton(
          child: const Text('ДА, УДАЛИТЬ!').textColor(Theme.of(context).errorColor),
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            BlocProvider.of<TodoCubit>(context, listen: false).deleteTodo(todo);
          },
        ),
      ],
    );
  }
}
