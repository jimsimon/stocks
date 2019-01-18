import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';

final localAuth = new LocalAuthentication();
final storage = new FlutterSecureStorage();

class LockScreenViewModel {
  final Store<AppState> store;

  LockScreenViewModel(this.store);
}
