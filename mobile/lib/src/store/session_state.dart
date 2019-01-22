import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:mobile/src/store/login_screen_state.dart';
import 'package:mobile/src/store/middleware/thunk_middleware.dart';
import 'package:redux/redux.dart';
import 'package:tastyworks_api_client/clients/vm_client.dart';
import 'package:tastyworks_api_client/models/session.dart';
import 'package:tastyworks_api_client/services/session_service.dart';

class SessionState {
  final Session session;
  final bool loading;

  SessionState({
    this.session,
    this.loading = false,
  });

  SessionState copyWith({session, loading}) {
    return SessionState(
      session: session ?? this.session,
      loading: loading ?? this.loading
    );
  }
}

class LoginAction extends ThunkAction<AppState> {
  final BuildContext context;
  final String usernameOrEmail;
  final String password;

  LoginAction(this.context, this.usernameOrEmail, this.password);

  call(Store<AppState> store) async {
    final storage = new FlutterSecureStorage();
    try {
      store.dispatch(SetSessionLoadingAction(true));
      var apiClient = VmClient();
      var sessionService = SessionService(apiClient);
      var session = await sessionService.createSession(usernameOrEmail, password);
      await sessionService.validateSession(session.sessionToken);
      await storage.write(key: 'usernameOrEmail', value: usernameOrEmail);
      await storage.write(key: 'password', value: password);
      store.dispatch(SetSessionAction(session));
    } on ApiException catch (e) {
      await storage.delete(key: 'usernameOrEmail');
      await storage.delete(key: 'password');
      store.dispatch(SetLoginErrorAction(e?.response?.message));
    } finally {
      store.dispatch(SetSessionLoadingAction(false));
    }
  }
}

class SetSessionAction {
  final Session session;

  SetSessionAction(this.session);
}

class SetSessionLoadingAction {
  final bool loading;

  SetSessionLoadingAction(this.loading);
}

SessionState sessionStateReducer(SessionState state, action) {
  return SessionState(
    session: TypedReducer(setSession)(state.session, action),
    loading: TypedReducer(setLoading)(state.loading, action)
  );
}

bool setLoading(bool state, SetSessionLoadingAction action) {
  return action.loading;
}

Session setSession(Session state, SetSessionAction action) {
  return action.session;
}