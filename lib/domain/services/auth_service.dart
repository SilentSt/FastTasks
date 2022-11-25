import 'package:flutter/cupertino.dart';
import 'package:tasklet/data/data_sources/auth/local_auth_ds.dart';
import 'package:tasklet/data/data_sources/auth/remote_auth_ds.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/core/app_service.dart';
import 'package:tasklet/domain/services/core/error_checker_mixin.dart';
import 'package:tasklet/presentation/app/app.dart';
import 'package:tasklet/presentation/navigation/app_router.dart';

class AuthService extends AppService<LocalAuthDataSource, RemoteAuthDataSource>
    with ErrorChecker {
  AuthService(super.lds, super.rds, super.errorService);

  @override
  Future<void> init(BuildContext context) async {
    LocalAuthDataSource.authState.addListener(authStateListener);
    await lds.readToken();
  }

  Future<UserAuthModel?> auth(UserAuthDto dto) async {
    final res = await rds.auth(dto);
    if (res.isSuccessful && res.body != null) {
      return res.body;
    } else {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
      return null;
    }
  }

  Future<UserConfirmModel?> confirm(UserConfirmDto dto) async {
    final res = await rds.confirm(dto);
    if (res.isSuccessful && res.body != null) {
      lds.saveToken(res.body!);
      return res.body;
    } else {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
      return null;
    }
  }

  Future<List<UserModel>> fetchUsers() async {
    final res = await rds.fetchUsers();
    final checked = errorChecker(res, nullableBody: false);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body ?? [];
  }

  Future<void> logout() async {
    await lds.removeToken();
  }

  void authStateListener() {
    if (LocalAuthDataSource.authState.value == AuthState.none) {
      App.router.replaceAll(
        [
          const AuthViewRoute(),
        ],
      );
    } else {
      if (App.router.current.name == AuthViewRoute.name) {
        App.router.replaceAll(
          [
            const RootViewRoute(),
          ],
        );
      }
    }
  }

  @override
  void dispose() {
    LocalAuthDataSource.authState.dispose();
  }
}
