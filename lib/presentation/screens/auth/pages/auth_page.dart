import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/gen/assets.gen.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/screens/auth/auth_vm.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';

class AuthPage extends ViewModelWidget<AuthViewModel> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 30,
          bottom: MediaQuery.of(context).padding.bottom + 65,
          left: 28,
          right: 28,
        ),
        children: [
          LottieBuilder.asset(Assets.animations.auth,height: 400),
          const SizedBox(height: 31),
          Text(
            textAlign: TextAlign.center,
            LocaleKeys.appName.tr(),
            style: AppTypography.sf.s38.w600,
          ),
          const SizedBox(height: 15),
          Text(
            LocaleKeys.appDescription.tr(),
            style: AppTypography.sf.s20.w400,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 39),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CupertinoButton(
                  onPressed: viewModel.pushToSignin,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(8),
                  ),
                  minSize: 0,
                  color: ColorName.black,
                  child: Text(
                    LocaleKeys.signIn.tr(),
                    style: AppTypography.sf.s16.white.w500,
                  ),
                ),
              ),
              Expanded(
                child: CupertinoButton(
                  onPressed: viewModel.pushToSignUp,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(8),
                  ),
                  minSize: 0,
                  color: ColorName.red,
                  child: Text(
                    LocaleKeys.signUp.tr(),
                    style: AppTypography.sf.s16.white.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
