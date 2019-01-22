import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile/src/screens/login_screen/login_screen_vm.dart';

typedef void OnSuccess(BuildContext context);

final localAuth = new LocalAuthentication();
final storage = new FlutterSecureStorage();

class LoginScreenPresenter extends StatelessWidget {
  final LoginScreenViewModel viewModel;

  const LoginScreenPresenter({
    Key key,
    @required this.viewModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildErrorMessage(viewModel, context),
            new TextField(
              decoration: new InputDecoration(
                hintText: 'Username or email address'),
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              autofocus: true,
              onChanged: viewModel.handleUsernameOrEmailChange,
            ),
            new TextField(
              obscureText: true,
              decoration: new InputDecoration(hintText: 'Password'),
              onChanged: viewModel.handlePasswordChange,
            ),
            new FlatButton(
              onPressed: !viewModel.loading ? viewModel.handleLogin : null,
              child: viewModel.loading ? CircularProgressIndicator() : Text(
                'Login')),
          ]
            ..removeWhere((w) => w == null),
        ),
      )
    );
  }

  Text buildErrorMessage(LoginScreenViewModel viewModel, BuildContext context) {
    if (viewModel.errorMessage == null) {
      return null;
    }

    return new Text(viewModel.errorMessage, style: TextStyle(color: Theme
      .of(context)
      .errorColor));
  }
}
