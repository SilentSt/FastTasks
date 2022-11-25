import 'package:flutter/cupertino.dart';
import 'package:tasklet/presentation/screens/auth/pages/auth_page.dart';
import 'package:tasklet/presentation/screens/auth/pages/sign_in_page.dart';
import 'package:tasklet/presentation/screens/auth/pages/sign_up_page.dart';

enum AuthEnum {
  auth,
  signIn,
  signUp,
}

extension AuthEnumRouter on AuthEnum {
  Widget get route {
    switch (this) {
      case AuthEnum.auth:
        return const AuthPage();
      case AuthEnum.signIn:
        return const SignInPage();
      case AuthEnum.signUp:
        return const SignUpPage();
    }
  }
}
