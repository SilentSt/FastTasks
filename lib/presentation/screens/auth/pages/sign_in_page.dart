import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/gen/assets.gen.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/screens/auth/auth_vm.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_back_button.dart';
import 'package:tasklet/presentation/widgets/app_button.dart';
import 'package:tasklet/presentation/widgets/app_pinput.dart';
import 'package:tasklet/presentation/widgets/app_text_field.dart';

class SignInPage extends ViewModelWidget<AuthViewModel> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(onTap: viewModel.pop),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 30,
          bottom: MediaQuery.of(context).padding.bottom + 65,
          left: 28,
          right: 28,
        ),
        children: [
          Text(
            textAlign: TextAlign.center,
            LocaleKeys.letsSignYouIn.tr(),
            style: AppTypography.sf.w600.s28,
          ),
          const SizedBox(height: 9),
          Text(
            textAlign: TextAlign.center,
            LocaleKeys.letsSignYouInMes.tr(),
            style: AppTypography.sf.w400.s20,
          ),
          const SizedBox(height: 20),
          LottieBuilder.asset(
            Assets.animations.hello,
            height: MediaQuery.of(context).size.height*.32,
            
          ),
          const SizedBox(height: 45),
          AppTextField.auth(
            controller: viewModel.emailController,
            title: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(height: 30),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(LocaleKeys.writeCode.tr(), style: AppTypography.sf.w400.s14),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: AppPinput(
                    controller: viewModel.codeController,
                    enabled: viewModel.codeSended,
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
            crossFadeState: viewModel.codeSended
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
            reverseDuration: const Duration(milliseconds: 300),
            firstCurve: Curves.easeIn,
            sizeCurve: Curves.easeIn,
            secondCurve: Curves.easeIn,
            alignment: Alignment.topCenter,
          ),
          AppButton.black(
            onTap: viewModel.codeSended
                ? viewModel.approveCode
                : viewModel.requestCode,
            text: viewModel.codeSended
                ? LocaleKeys.signIn.tr()
                : LocaleKeys.sendCode.tr(),
          ),
        ],
      ),
    );
  }
}
