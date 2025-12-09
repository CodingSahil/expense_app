import 'dart:async';

import 'package:expense_app/utils/constants/debug_log_function.dart';
import 'package:flutter/material.dart';

class AnimatedLoginLoader extends StatefulWidget {
  const AnimatedLoginLoader({super.key, this.isDone = false});

  final bool isDone;

  @override
  State<AnimatedLoginLoader> createState() => _AnimatedLoginLoaderState();
}

class _AnimatedLoginLoaderState extends State<AnimatedLoginLoader> with SingleTickerProviderStateMixin {
  bool firstStretch = true;
  bool secondStretch = false;
  bool thirdStretch = false;
  bool isDone = false;
  late final AnimationController controller;
  late final Animation<num> animationForOpacity;
  late final Animation<num> animationForSize;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationForOpacity = TweenSequence<num>([
      TweenSequenceItem(tween: Tween<num>(begin: 0, end: 1), weight: 1),
    ]).animate(controller);
    animationForSize = TweenSequence<num>([
      TweenSequenceItem(tween: Tween<num>(begin: 18, end: 22), weight: 1),
      TweenSequenceItem(tween: Tween<num>(begin: 22, end: 20), weight: 1),
    ]).animate(controller);

    Timer.periodic(Duration(milliseconds: 500), (timer) async {
      if (firstStretch && !secondStretch) {
        firstStretch = !firstStretch;
        secondStretch = !secondStretch;
      } else if (secondStretch && !thirdStretch) {
        secondStretch = !secondStretch;
        thirdStretch = !thirdStretch;
      } else if (thirdStretch && !firstStretch) {
        thirdStretch = !thirdStretch;
        firstStretch = !firstStretch;
      }

      if (timer.tick == 10) {
        isDone = true;
        await Future.delayed(Duration(milliseconds: 200));
        controller.forward();
        controller.addStatusListener((status) {
          debugLog("status => $status");
        });
        timer.cancel();
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      child: SizedBox(
        height: 20,
        child: isDone
            ? AnimatedBuilder(
                animation: animationForOpacity,
                builder: (context, child) => Opacity(opacity: animationForOpacity.value.toDouble(), child: child),
                child: AnimatedBuilder(
                  animation: animationForSize,
                  builder: (context, child) => Icon(
                    Icons.verified,
                    color: Theme.of(context).colorScheme.surface,
                    size: animationForSize.value.toDouble(),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.only(right: 4),
                    color: Theme.of(context).colorScheme.surface,
                    height: (index == 0 && firstStretch) || (index == 1 && secondStretch) || (index == 2 && thirdStretch)
                        ? 12
                        : 5,
                    width: 10,
                  ),
                ),
              ),
      ),
    );
  }
}
