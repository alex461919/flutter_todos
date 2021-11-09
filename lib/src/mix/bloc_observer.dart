import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/src/mix/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.d('onCreate -- ${bloc.runtimeType} , hash: ${bloc.hashCode}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.d('onClose -- ${bloc.runtimeType} , hash: ${bloc.hashCode}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d(
        'onChange -- ${bloc.runtimeType} , hash: ${bloc.hashCode},\ncurrentState: ${change.currentState.toString()},\nnextState: ${change.nextState.toString()}');
  }
/*
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.d('onError -- ${bloc.runtimeType} , hash: ${bloc.hashCode}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.d('onEvent -- ${bloc.runtimeType} , hash: ${bloc.hashCode}, $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.d('onEvent -- ${bloc.runtimeType} , hash: ${bloc.hashCode}, $transition');
  }
  */
}
