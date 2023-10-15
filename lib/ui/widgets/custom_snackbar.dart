import 'package:flutter/material.dart';
import 'package:spesco_app/ui/common/app_colors.dart';

showCustomSnackBar(
  BuildContext context,
  String content, {
  bool isError = false,
  Duration duration = const Duration(milliseconds: 3000),
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: isError ? kErrorColor : kcPrimaryColor,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(16),
    ),
  );
}
