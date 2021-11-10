import 'package:auto_route/auto_route.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todos/src/injector.dart';
import 'package:flutter_todos/src/mix/util.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_add_screen/todo_add_cubit.dart';
import 'package:flutter_todos/src/presentation/blocs/todo_add_screen/todo_add_state.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

class MaterialTodoAddPage extends HookWidget implements AutoRouteWrapper {
  const MaterialTodoAddPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => TodoAddCubit(injector(), injector()), lazy: true, child: this);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    String? _title;
    String? _note;
    DateTime? _date;
    return Scaffold(
      //
      appBar: AppBar(
        title: const Text('Новое задание'),
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
      body: BlocConsumer<TodoAddCubit, TodoAddCubitState>(
        listener: (context, state) {
          if (state is FulfilledTodoAddBlocState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Успешно')));
            if (context.router.stackData.length == 1) {
              context.router.replaceNamed('/');
            } else {
              context.router.popUntilRoot();
            }
          }
          if (state is RejectedTodoAddBlocState) {
            showErrorMessage(context, state.get());
          }
        },
        builder: (context, state) {
          return [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: [
                  TextFormField(
                    autofocus: true,
                    initialValue: '', //_title,
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
                    maxLines: null,
                    onSaved: (val) {
                      _note = val;
                    },
                    decoration: const InputDecoration(labelText: 'Дополнительно'),
                  ).padding(vertical: 8),
                  DateTimeField(
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
                ].toColumn(),
              ),
            ).center(),
            if (state is PendingTodoAddCubitState) ...[const WaitIndicator().center()],
          ].toStack();
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            ScaffoldMessenger.of(context).clearSnackBars();
            final cubit = BlocProvider.of<TodoAddCubit>(context, listen: false);
            // ignore: cascade_invocations
            cubit.addTodo(title: _title!, note: _note, date: _date!);
          }
        },
        tooltip: 'Сохранить',
        child: const Icon(Icons.save_alt, size: 28.0),
      ),
    );
  }
}
