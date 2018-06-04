import 'package:iex_trading_client/api_client.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';
import 'dart:async';

typedef Future<T> RequestFunction<T>(dynamic service);

abstract class CallServiceAction<T> {
  Type get serviceType;
  RequestFunction<T> get request;
  Function get successAction;
  Function get errorAction;
  Function get completeAction => null;
}

class ServiceMiddleware extends MiddlewareClass<AppState> {
  final Map <Type, dynamic> serviceMap;

  ServiceMiddleware(this.serviceMap);

  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is CallServiceAction) {
      var service = serviceMap[action.serviceType];
      try {
        var requestFunction = action.request;
        if (requestFunction != null) {
          var response = await requestFunction(service);
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