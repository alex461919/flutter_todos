import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_todos/main.gr.dart';
import 'package:flutter_todos/src/injector.dart';
import 'package:flutter_todos/src/mix/bloc_observer.dart';
import 'package:flutter_todos/src/presentation/blocs/date_range_select/date_range_bloc.dart';
import 'package:flutter_todos/src/presentation/pages/todo_add/material_todo_add_page.dart';
import 'package:flutter_todos/src/presentation/pages/todo_detail/material_todo_page.dart';
import 'package:flutter_todos/src/presentation/pages/todo_list/material_todo_list_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  //Bloc.observer = AppBlocObserver();
  runApp(
    BlocProvider<DateRangeBloc>(create: (_) => injector(), child: MaterialTodosApp()),
  );
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<StatelessWidget>(
      path: '/',
      page: MaterialTodoListPage,
      initial: true,
    ),
    AutoRoute<StatelessWidget>(
      path: '/add',
      page: MaterialTodoAddPage,
    ),
    AutoRoute<StatelessWidget>(
      path: '/:id',
      page: MaterialTodoPage,
      children: [
        AutoRoute<StatelessWidget>(path: 'detail', page: MaterialTodoDetailWidget, name: 'DetailTab'),
        AutoRoute<StatelessWidget>(path: 'edit', page: MaterialTodoEditWidget, name: 'EditTab'),
        AutoRoute<StatelessWidget>(path: 'state_edit', page: MaterialStateEditWidget, name: 'StateEditTab'),
        AutoRoute<StatelessWidget>(path: 'delete', page: MaterialTodoDeleteWidget, name: 'DeleteTab'),
        RedirectRoute(path: '*', redirectTo: 'detail'),
      ],
    ),
  ],
)
class $AppRouter {}

class MaterialTodosApp extends StatelessWidget {
  MaterialTodosApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          // navigatorObservers: () => [AppRouterObserver()],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Flutter Demo',
        theme: _customTheme(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ru', 'RU'),
        ],
      );

  ThemeData _customTheme([String? mode = 'light']) {
    final theme = ThemeData(
      brightness: mode == 'dark' ? Brightness.dark : Brightness.light,
      textTheme: const TextTheme(
        bodyText1: TextStyle(fontSize: 14.0),
        bodyText2: TextStyle(fontSize: 14.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.blueGrey.shade200, height: 0.5),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade200),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade900),
        ),
      ),
    );
    return theme;
  }
}
