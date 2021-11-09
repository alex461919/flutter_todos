import 'dart:async';

Future<T> getStreamValue<T>(Stream<T> stream) {
  final completer = Completer<T>();
  late final StreamSubscription<T> subscription;
  subscription = stream.listen((val) {
    subscription.cancel();
    completer.complete(val);
    // ignore: avoid_types_on_closure_parameters
  }, onError: (Object e) {
    subscription.cancel();
    completer.completeError(e);
  });
  return completer.future;
}
