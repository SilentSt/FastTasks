import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/domain/di/global_dependency.dart';
import 'package:tasklet/presentation/screens/auth/enums/auth_enum.dart';

import 'auth_vm.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(
        authService: context.global.authService,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width > 700
                  ? 700
                  : MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width > 700
                        ? 700
                        : MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        switchInCurve: Curves.easeIn,
                        switchOutCurve: Curves.easeIn,
                        reverseDuration: const Duration(milliseconds: 200),
                        child: model.currentPage.route,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
