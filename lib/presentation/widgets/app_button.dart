import 'package:flutter/cupertino.dart';
import 'package:tasklet/gen/assets.gen.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.textStyle,
    this.icon,
    this.buttonColor,
    this.borderRadius,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;
  final SvgGenImage? icon;
  final Color? buttonColor;
  final double? borderRadius;

  factory AppButton.black({
    required VoidCallback onTap,
    required String text,
    TextStyle? textStyle,
    SvgGenImage? icon,
    double? borderRadius,
  }) =>
      AppButton(
        onTap: onTap,
        text: text,
        borderRadius: borderRadius,
        buttonColor: ColorName.black,
        icon: icon,
        textStyle: textStyle == null
            ? AppTypography.sf.s18.white.w500
            : textStyle.copyWith(color: ColorName.white),
      );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      minSize: 0,
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      color: ColorName.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!.svg(),
            const SizedBox(width: 5),
          ],
          Text(
            text,
            style: textStyle ?? AppTypography.sf.s18.w600.black,
          ),
        ],
      ),
    );
  }
}
