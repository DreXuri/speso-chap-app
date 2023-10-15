import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spesco_app/ui/common/app_colors.dart';
import 'package:spesco_app/ui/extension/app_typography.dart';
import 'package:spesco_app/ui/extension/palette.dart';

class MessageTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyBoardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool hasLabel;
  final double? verticalContentPadding;
  final EdgeInsets padding;
  final bool filled;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final String? label;
  final Color borderColor;
  final Color? fillColor;
  final InputBorder? inputBorder;

  /// A custom TextFormField to accept user input
  const MessageTextField({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.keyBoardType,
    this.suffixIcon,
    this.hasLabel = true,
    this.verticalContentPadding,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0),
    this.filled = true,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.label,
    this.borderColor = kcBackgroundColor,
    this.fillColor,
    this.inputBorder,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppTypography? typography = theme.extension<AppTypography>();
    final Palette? palette = theme.extension<Palette>();
    return Padding(
      padding: padding,
      child: TextFormField(
        maxLines: null,
        expands: true,
        cursorColor: kcLightGrey,
        textAlignVertical: textAlignVertical,
        autocorrect: true,
        textAlign: textAlign,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyBoardType,
        controller: controller,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          isDense: true,
          suffixIcon: suffixIcon,
          suffixIconColor: kcLightGrey,
          border: inputBorder,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kcBackgroundColor),
              borderRadius: BorderRadius.circular(8.0.r)),
          contentPadding: EdgeInsets.symmetric(
              vertical: verticalContentPadding ?? 18.0.h, horizontal: 16.0.w),
          hintText: hintText,
          hintStyle:
              typography?.labelRegular14?.copyWith(color: palette?.gray11),
          errorStyle:
              typography?.labelRegular14?.copyWith(color: palette?.gray11),
          labelStyle:
              typography?.labelRegular14?.copyWith(color: palette?.gray11),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kcDarkGreyColor),
              borderRadius: BorderRadius.circular(8.0.r)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kcPrimaryColor),
              borderRadius: BorderRadius.circular(8.0)),
        ),
        onChanged: (String value) => onChanged?.call(value),
        validator: (String? value) => validator?.call(value),
      ),
    );
  }
}
