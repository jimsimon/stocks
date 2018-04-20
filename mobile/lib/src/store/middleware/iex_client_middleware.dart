import 'package:iex_trading_client/api_client.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/store/util/fsa.dart';
import 'package:redux/redux.dart';
import 'dart:async';

typedef Future<T> RequestFunction<T>(ApiClient client);
typedef FluxStandardAction<T> SuccessFunction<T>(T response);
typedef FluxStandardAction<T> ErrorFunction<T>(error);

class IexClientRequest<T> {
  final RequestFunction<T> request;
  final Function successAction;
  final Function errorAction;
  final Function completeAction;

  IexClientRequest(this.request,
      {this.successAction,
      this.errorAction,
      this.completeAction});
}

class IexClientRequestAction extends FluxStandardAction<IexClientRequest> {
  IexClientRequestAction(IexClientRequest payload) : super(payload: payload);
}

class IexClientMiddleware extends MiddlewareClass<AppState> {
  final ApiClient client;

  IexClientMiddleware(this.client);

  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is IexClientRequestAction) {
      try {
        var response = await action.payload.request(client);
        var successAction = action.payload.successAction;
        if (successAction != null) {
          store.dispatch(successAction(response));
        }
      } catch (e) {
        print(e);
        var errorAction = action.payload.errorAction;
        if (errorAction != null) {
          store.dispatch(errorAction(e));
        }
      } finally {
        var completeAction = action.payload.completeAction;
        if (completeAction != null) {
          store.dispatch(completeAction());
        }
      }
    }
    next(action);
  }
}