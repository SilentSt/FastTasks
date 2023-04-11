import 'package:flutter/material.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.title = '',
    required this.controller,
    this.obscure = false,
    this.maxLength,
    this.maxLines,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.height = 60,
    this.onEnterText,
    this.outlinedBorder,
    this.hint = '',
    this.minLines,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final TextInputType keyboardType;
  final double height;
  final InputBorder? outlinedBorder;
  final VoidCallback? onEnterText;

  factory AppTextField.auth({
    String title = '',
    String hint = '',
    required TextEditingController controller,
    bool obscure = false,
    int? maxLength,
    int? maxLines,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
    double height = 60,
    VoidCallback? onEnterText,
  }) =>
      AppTextField(
        controller: controller,
        enabled: enabled,
        height: height,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLines: maxLines,
        hint: hint,
        title: title,
        obscure: obscure,
        onEnterText: onEnterText,
        outlinedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: ColorName.grey,
          ),
        ),
      );

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.left,
        onChanged: (val) {
          if (widget.onEnterText != null) {
            widget.onEnterText!();
          }
        },
        decoration: InputDecoration(
          labelText: widget.title,
          floatingLabelStyle: AppTypography.sf.s16.w400.lightGrey,
          labelStyle: AppTypography.sf.s16.w400.lightGrey,
          hintStyle: AppTypography.sf.s16.w400,
          focusColor: ColorName.black,
          fillColor: ColorName.black,
          hintText: widget.hint,
          suffixIcon: widget.obscure
              ? isObscured
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscured = false;
                        });
                      },
                      icon: const Icon(Icons.visibility),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isObscured = true;
                        });
                      },
                      icon: const Icon(Icons.visibility_off),
                    )
              : const SizedBox.shrink(),
          border: widget.outlinedBorder ??
              (widget.maxLines != null
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorName.darkGrey,
                      ),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.darkGrey,
                      ),
                    )),
          errorBorder: widget.outlinedBorder ??
              (widget.maxLines != null
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.purple,
                      ),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.purple,
                      ),
                    )),
          enabledBorder: widget.outlinedBorder ??
              (widget.maxLines != null
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.darkGrey,
                      ),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.darkGrey,
                      ),
                    )),
          focusedErrorBorder: widget.outlinedBorder ??
              (widget.maxLines != null
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.purple,
                      ),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.purple,
                      ),
                    )),
          disabledBorder: widget.outlinedBorder ??
              (widget.maxLines != null
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.darkGrey,
                      ),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.darkGrey,
                      ),
                    )),
          focusedBorder: widget.outlinedBorder ??
              (widget.maxLines != null
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.purple,
                      ),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: ColorName.purple,
                      ),
                    )),
        ),
        // expands: true,
        maxLength: widget.maxLength,
        maxLines: widget.obscure ? 1 : widget.maxLines,
        minLines: widget.minLines,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscure ? isObscured : false,
        obscuringCharacter: '*',
      ),
    );
  }
}
