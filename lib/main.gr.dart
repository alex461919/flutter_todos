// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:flutter/material.dart' as _i5;

import 'src/presentation/pages/todo_add/material_todo_add_page.dart' as _i2;
import 'src/presentation/pages/todo_detail/material_todo_page.dart' as _i3;
import 'src/presentation/pages/todo_list/material_todo_list_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MaterialTodoListRoute.name: (routeData) {
      return _i4.MaterialPageX<_i6.StatelessWidget>(
          routeData: routeData, child: const _i1.MaterialTodoListPage());
    },
    MaterialTodoAddRoute.name: (routeData) {
      return _i4.MaterialPageX<_i6.StatelessWidget>(
          routeData: routeData, child: const _i2.MaterialTodoAddPage());
    },
    MaterialTodoRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<MaterialTodoRouteArgs>(
          orElse: () => MaterialTodoRouteArgs(id: pathParams.getString('id')));
      return _i4.MaterialPageX<_i6.StatelessWidget>(
          routeData: routeData,
          child: _i3.MaterialTodoPage(id: args.id, key: args.key));
    },
    DetailTab.name: (routeData) {
      return _i4.MaterialPageX<_i6.StatelessWidget>(
          routeData: routeData, child: const _i3.MaterialTodoDetailWidget());
    },
    EditTab.name: (routeData) {
      return _i4.MaterialPageX<_i6.StatelessWidget>(
          routeData: routeData, child: const _i3.MaterialTodoEditWidget());
    },
    StateEditTab.name: (routeData) {
      return _i4.MaterialPageX<_i6.StatelessWidget>(
          routeData: routeData, child: const _i3.MaterialStateEditWidget());
    },
    DeleteTab.name: (routeData) {
      return _i4.MaterialPageX<_i6.StatelessWidget>(
          routeData: routeData, child: const _i3.MaterialTodoDeleteWidget());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MaterialTodoListRoute.name, path: '/'),
        _i4.RouteConfig(MaterialTodoAddRoute.name, path: '/add'),
        _i4.RouteConfig(MaterialTodoRoute.name, path: '/:id', children: [
          _i4.RouteConfig(DetailTab.name,
              path: 'detail', parent: MaterialTodoRoute.name),
          _i4.RouteConfig(EditTab.name,
              path: 'edit', parent: MaterialTodoRoute.name),
          _i4.RouteConfig(StateEditTab.name,
              path: 'state_edit', parent: MaterialTodoRoute.name),
          _i4.RouteConfig(DeleteTab.name,
              path: 'delete', parent: MaterialTodoRoute.name),
          _i4.RouteConfig('*#redirect',
              path: '*',
              parent: MaterialTodoRoute.name,
              redirectTo: 'detail',
              fullMatch: true)
        ])
      ];
}

/// generated route for [_i1.MaterialTodoListPage]
class MaterialTodoListRoute extends _i4.PageRouteInfo<void> {
  const MaterialTodoListRoute() : super(name, path: '/');

  static const String name = 'MaterialTodoListRoute';
}

/// generated route for [_i2.MaterialTodoAddPage]
class MaterialTodoAddRoute extends _i4.PageRouteInfo<void> {
  const MaterialTodoAddRoute() : super(name, path: '/add');

  static const String name = 'MaterialTodoAddRoute';
}

/// generated route for [_i3.MaterialTodoPage]
class MaterialTodoRoute extends _i4.PageRouteInfo<MaterialTodoRouteArgs> {
  MaterialTodoRoute(
      {required String id, _i6.Key? key, List<_i4.PageRouteInfo>? children})
      : super(name,
            path: '/:id',
            args: MaterialTodoRouteArgs(id: id, key: key),
            rawPathParams: {'id': id},
            initialChildren: children);

  static const String name = 'MaterialTodoRoute';
}

class MaterialTodoRouteArgs {
  const MaterialTodoRouteArgs({required this.id, this.key});

  final String id;

  final _i6.Key? key;
}

/// generated route for [_i3.MaterialTodoDetailWidget]
class DetailTab extends _i4.PageRouteInfo<void> {
  const DetailTab() : super(name, path: 'detail');

  static const String name = 'DetailTab';
}

/// generated route for [_i3.MaterialTodoEditWidget]
class EditTab extends _i4.PageRouteInfo<void> {
  const EditTab() : super(name, path: 'edit');

  static const String name = 'EditTab';
}

/// generated route for [_i3.MaterialStateEditWidget]
class StateEditTab extends _i4.PageRouteInfo<void> {
  const StateEditTab() : super(name, path: 'state_edit');

  static const String name = 'StateEditTab';
}

/// generated route for [_i3.MaterialTodoDeleteWidget]
class DeleteTab extends _i4.PageRouteInfo<void> {
  const DeleteTab() : super(name, path: 'delete');

  static const String name = 'DeleteTab';
}
