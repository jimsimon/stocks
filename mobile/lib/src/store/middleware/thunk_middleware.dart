import 'dart:async';

import 'package:redux/redux.dart';

typedef void ThunkFunctionAction<State>(Store<State> store);

abstract class ThunkAction<State> {
  final Completer _completer = Completer();

  FutureOr call(Store<State> store);

  Future get onComplete => _completer.future;
}

class ThunkMiddleware<T> extends MiddlewareClass<T> {
  @override
  call(Store<T> store, dynamic action, NextDispatcher next) async {
    if (action is ThunkFunctionAction) {
      action(store);
    }

    if (action is ThunkAction) {
      try {
        var result = await action.call(store);
        action._completer.complete(result);
      } catch (e) {
        action._completer.completeError(e);
      }
    }

    return next(action);
  }
}

