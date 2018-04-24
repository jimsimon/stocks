import 'package:iex_trading_client/api_client.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';
import 'dart:async';

typedef Future<T> RequestFunction<T>(ApiClient client);

abstract class IexClientRequestAction<T> {
  RequestFunction<T> get request;
  Function get successAction;
  Function get errorAction;
  Function get completeAction => null;
}

class IexClientMiddleware extends MiddlewareClass<AppState> {
  final ApiClient client;

  IexClientMiddleware(this.client);

  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is IexClientRequestAction) {
      try {
        var requestFunction = action.request;
        if (requestFunction != null) {
          var response = await requestFunction(client);
          var successAction = action.successAction;
          if (successAction != null) {
            store.dispatch(successAction(response));
          }
        }
      } catch (e) {
        print(e);
        var errorAction = action.errorAction;
        if (errorAction != null) {
          store.dispatch(errorAction(e));
        }
      } finally {
        var completeAction = action.completeAction;
        if (completeAction != null) {
          store.dispatch(completeAction());
        }
      }
    }
    next(action);
  }
}