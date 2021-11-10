import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todos/src/mix/logger.dart';
import 'package:styled_widget/styled_widget.dart';

DateTime todayPlus(int days) {
  final nowPlus = DateTime.now().add(Duration(days: days));
  return DateTime(nowPlus.year, nowPlus.month, nowPlus.day);
}

Future<T> futureWithProgressAndModalError<T>(BuildContext context, Future<T> future) {
  /*
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white54,
    builder: (context) => const WaitIndicator().center(),
  );
  */
  return future
    ..then((val) {
      // context.router.pop();
    })
    // ignore: avoid_types_on_closure_parameters
    ..catchError(
      (Object error) {
        // context.router.pop();
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.white54,
          builder: (context) {
            return AlertDialog(
              title: const Text('Ошибка!'),
              content: Text(error.toString()).textColor(Theme.of(context).errorColor),
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
      },
    );
}

void navigateToHome(BuildContext context) {
  if (context.router.stackData.length == 1) {
    context.router.replaceNamed('/');
  } else {
    context.router.popUntilRoot();
  }
}

void showErrorMessage(BuildContext context, Exception? exception) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white54,
    builder: (context) {
      return AlertDialog(
        title: const Text('Ошибка!'),
        content: Text(exception.toString()).textColor(Theme.of(context).errorColor),
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
}

class WaitIndicator extends StatelessWidget {
  const WaitIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        child: CircularProgressIndicator(
          color: Theme.of(context).textTheme.bodyText2?.color ?? Theme.of(context).colorScheme.primary,
          strokeWidth: 6.0,
        ),
        height: 56.0,
        width: 56.0,
      );
}
