import 'package:auto_route/auto_route.dart';
import 'package:tasklet/data/data_sources/auth/local_auth_ds.dart';
import 'package:tasklet/presentation/navigation/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (LocalAuthDataSource.authState.value == AuthState.authorized) {
      resolver.next();
    } else {
      await router.push(const AuthViewRoute());
    }
  }
}
