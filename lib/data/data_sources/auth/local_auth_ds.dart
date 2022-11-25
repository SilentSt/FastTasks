import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tasklet/data/data_sources/core/app_local_ds.dart';
import 'package:tasklet/data/models/models.dart';

enum AuthState { authorized, none }

class LocalAuthDataSource extends ChangeNotifier implements AppLocalDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final _tokenKey = 'authToken';

  static ValueNotifier<AuthState> authState = ValueNotifier(AuthState.none);
  static UserConfirmModel? session;

  void saveToken(UserConfirmModel model) async {
    session = model;
    final json = model.toJson();
    authState.value = AuthState.authorized;
    authState.notifyListeners();
    _storage.write(key: _tokenKey, value: json);
  }

  Future<void> readToken() async {
    final res = await _storage.read(key: _tokenKey);
    if (res == null) {
      authState.value = AuthState.none;
      return;
    }
    authState.value = AuthState.authorized;
    authState.notifyListeners();
    session = Mapper.fromJson(res);
  }

  Future<void> removeToken() async {
    await _storage.deleteAll();
    session = null;
    authState.value = AuthState.none;
    authState.notifyListeners();
  }
}
