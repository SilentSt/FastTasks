import 'package:flutter/cupertino.dart';
import 'package:tasklet/gen/assets.gen.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    this.onTap,
    this.icon,
    this.iconColor,
    this.buttonColor,
    this.iconWidget,
  }) : super(key: key);

  final VoidCallback? onTap;
  final SvgGenImage? icon;
  final Color? iconColor;
  final Color? buttonColor;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    if (icon == null && iconWidget == null) {
      throw AssertionError('need to implement at least icon or iconWidget');
    }
    return CupertinoButton(
      onPressed: onTap,
      padding: const EdgeInsets.all(5),
      minSize: 0,
      color: buttonColor,
      borderRadius: BorderRadius.circular(12),
      child: iconWidget ?? icon!.svg(color: iconColor),
    );
  }
}
