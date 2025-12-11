import 'package:expense_app/utils/themes/text-style.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget commonAppBar({
  required String title,
  required BuildContext context,
  bool isDone = false,
  bool centerTitle = true,
  void Function()? onDone,
}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  return AppBar(
    // backgroundColor: colorScheme.onPrimary,
    backgroundColor: colorScheme.onPrimaryFixed,
    centerTitle: centerTitle,
    iconTheme: IconThemeData(color: colorScheme.onSurface),
    title: AppTextTheme.text(title, color: colorScheme.onSurface, fontSize: 18, fontWeight: FontWeight.w900),
    actions: [
      if (isDone)
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onDone,
          child: Icon(Icons.done, color: colorScheme.onSurface, size: 22),
        ),
    ],
    actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
  );
}
