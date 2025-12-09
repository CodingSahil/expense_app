import 'package:expense_app/utils/themes/text-style.dart';
import 'package:flutter/material.dart';

void errorSnackBar({required BuildContext context, required String message}) {
  final snackBar = SnackBar(
    content: AppTextTheme.text(
      message,
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w900,
      fontSize: 15,
    ),
    backgroundColor: Theme.of(context).colorScheme.errorContainer,
    duration: Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
