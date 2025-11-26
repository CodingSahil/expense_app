import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.color, this.strokeWidth = 2});

  final Color? color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 12, height: 12, child: CircularProgressIndicator(color: color ?? Theme.of(context).colorScheme.onSurface, strokeWidth: strokeWidth));
  }
}
