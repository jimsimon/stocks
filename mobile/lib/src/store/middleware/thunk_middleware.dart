import 'package:redux/redux.dart';

typedef void ThunkFunctionAction<State>(Store<State> store);

abstract class ThunkAction<T> {
  void call(Store<T> store);
}

class ThunkMiddleware<T> extends MiddlewareClass<T> {
  @override
  void call(Store<T> store,
    dynamic action,
    NextDispatcher next) {
    if (action is ThunkFunctionAction) {
      action(store);
    } else if (action is ThunkAction) {
      action.call(store);
    } else {
      next(action);
    }
  }
}

