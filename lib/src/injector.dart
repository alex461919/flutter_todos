// ignore_for_file: cascade_invocations

import 'package:flutter_todos/src/data/datasources/todos_datasource.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/fake_data.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/hive_todos_datasource_impl.dart';
import 'package:flutter_todos/src/data/hive_todos_datasource/mappers/hive_mapper.dart';
import 'package:flutter_todos/src/data/mappers/todos_data_mappers.dart';
import 'package:flutter_todos/src/data/todos_data_repository_impl.dart';
import 'package:flutter_todos/src/domain/repositories/todos_repository.dart';
import 'package:flutter_todos/src/domain/usecases/add_todo_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/delete_todo_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/get_sate_list_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/get_todo_list_usecase.dart';
import 'package:flutter_todos/src/domain/usecases/update_todo_usecase.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
// todos hive datasource
  injector.registerFactory<HiveMapper>(() => HiveMapper());

  final todosHiveDataSourceImpl = HiveTodosDataSourceImpl(injector());
  await todosHiveDataSourceImpl.init(fakeStatesMap, getFakeTodosMap(50, 10));
  injector.registerSingleton<TodosDataSource>(todosHiveDataSourceImpl);

  // todos repository
  injector.registerFactory<DataRepositoryMapper>(() => DataRepositoryMapper());

  injector.registerSingleton<TodosRepository>(TodosDataRepositoryImpl(injector(), injector()));

  // UseCases
  injector.registerSingleton<GetTodoListUseCase>(GetTodoListUseCase(injector()));
  injector.registerSingleton<GetStateListUseCase>(GetStateListUseCase(injector()));
  injector.registerSingleton<AddTodoUseCase>(AddTodoUseCase(injector()));
  injector.registerSingleton<UpdateTodoUseCase>(UpdateTodoUseCase(injector()));
  injector.registerSingleton<DeleteTodoUseCase>(DeleteTodoUseCase(injector()));

  //injector.registerSingleton<DateRangeChangeNotifier>(DateRangeChangeNotifier());
  injector.registerSingleton<DateRangeBloc>(DateRangeBloc());

  // Blocs
/*
  injector.registerFactoryParam<TodoListBloc, DateTimeRange Function(), void>(
    (rangeFn, _) => TodoListBloc(injector<GetTodoListUseCase>(), rangeFn),
  );
  */
}
