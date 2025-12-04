import 'package:expense_app/utils/themes/text-style.dart';
import 'package:flutter/material.dart';

class ClickablePrimaryButton extends StatelessWidget {
  const ClickablePrimaryButton({
    super.key,
    required this.label,
    this.labelFontSize = 15,
    this.width,
    this.height,
    this.onTap,
    this.buttonColor,
    this.fontColor,
    this.disableButton = false,
    this.isLoader = false,
    this.loader,
  });

  final String label;
  final double labelFontSize;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final Color? buttonColor;
  final Color? fontColor;
  final bool isLoader;
  final Widget? loader;
  final bool disableButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: disableButton ? () {} : onTap,
      child: Container(
        width: width,
        height: height ?? MediaQuery.sizeOf(context).height * 0.055,
        decoration: BoxDecoration(
          color: disableButton
              ? Theme.of(context).colorScheme.onSurfaceVariant
              : (buttonColor ?? Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: disableButton
                ? Theme.of(context).colorScheme.onSurfaceVariant
                : (buttonColor ?? Theme.of(context).colorScheme.primary),
            width: 1.5,
          ),
        ),
        alignment: Alignment.center,
        child: isLoader && loader != null
            ? loader
            : AppTextTheme.text(
                label,
                fontSize: labelFontSize,
                color: disableButton
                    ? Theme.of(context).colorScheme.surface
                    : (fontColor ?? Theme.of(context).colorScheme.surface),
                fontWeight: FontWeight.w800,
              ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  const BorderButton({
    super.key,
    required this.label,
    this.labelFontSize = 15,
    this.width,
    this.height,
    this.onTap,
    this.fontColor,
    this.borderColor,
    this.disableButton = false,
    this.isLoader = false,
    this.loader,
  });

  final String label;
  final double labelFontSize;
  final double? width;
  final double? height;
  final void Function()? onTap;
  final Color? fontColor;
  final Color? borderColor;
  final bool disableButton;
  final bool isLoader;
  final Widget? loader;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: disableButton ? () {} : onTap,
      child: Container(
        width: width,
        height: height ?? MediaQuery.sizeOf(context).height * 0.055,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: disableButton
                ? Theme.of(context).colorScheme.onSurfaceVariant
                : (borderColor ?? (fontColor ?? Theme.of(context).colorScheme.primary)),
            width: 1.5,
          ),
        ),
        alignment: Alignment.center,
        child: isLoader && loader != null
            ? loader
            : AppTextTheme.text(
                label,
                fontSize: labelFontSize,
                color: disableButton
                    ? Theme.of(context).colorScheme.onSurfaceVariant
                    : (fontColor ?? Theme.of(context).colorScheme.primary),
                fontWeight: FontWeight.w800,
              ),
      ),
    );
  }
}
