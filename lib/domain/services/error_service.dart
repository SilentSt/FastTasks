import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:tasklet/gen/assets.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_text_button.dart';

class ErrorService {
  ErrorService(this._appContext);
  final BuildContext _appContext;

  Future showEror({
    final String? error,
  }) async {
    await showCupertinoDialog(
      context: _appContext,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            LocaleKeys.error.tr(),
            style: AppTypography.sf.s18.w600,
          ),
          content: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                LottieBuilder.asset(
                  Assets.animations.error,
                  height: 100,
                ),
                Text(
                  error ?? LocaleKeys.unhadledError.tr(),
                  style: AppTypography.sf.w400.s14.lightGrey,
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: AppTextButton(
                onTap: Navigator.of(context).pop,
                text: 'Ok',
              ),
            ),
          ],
        );
      },
    );
  }
}
