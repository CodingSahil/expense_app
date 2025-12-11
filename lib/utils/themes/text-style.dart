import 'dart:ui';

import 'package:flutter/material.dart';

class AppTextTheme {
  static TextStyle textStyle({required Color color, bool isBoldonse = false, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: isBoldonse ? 'Boldonse' : 'Lato',
      color: color,
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight,
    );
  }

  static Widget text(
    String text, {
    required Color color,
    double? fontSize,
    FontWeight? fontWeight,
    bool isBoldonse = false,
  }) {
    return Text(
      text,
      style: textStyle(color: color, fontSize: fontSize, fontWeight: fontWeight, isBoldonse: isBoldonse),
    );
  }
}
