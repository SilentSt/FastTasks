import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';

class AppPinput extends StatelessWidget {
  const AppPinput({
    Key? key,
    required this.controller,
    required this.enabled,
    this.length = 5,
  }) : super(key: key);

  final TextEditingController controller;
  final bool enabled;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      enabled: enabled,
      controller: controller,
      keyboardType: TextInputType.text,
      length: length,
      defaultPinTheme: PinTheme(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorName.lightGrey,
        ),
        width: 35,
        height: 35,
        textStyle: AppTypography.sf.s16.w600,
      ),
      focusedPinTheme: PinTheme(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorName.blue.withOpacity(.3),
        ),
        width: 35,
        height: 35,
        textStyle: AppTypography.sf.s16.w600,
      ),
      submittedPinTheme: PinTheme(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorName.black.withOpacity(.2),
        ),
        width: 35,
        height: 35,
        textStyle: AppTypography.sf.s16.w600,
      ),
      pinAnimationType: PinAnimationType.scale,
    );
  }
}