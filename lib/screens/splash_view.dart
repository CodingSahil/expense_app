import 'package:expense_app/utils/extenstions/integer_extenstion.dart';
import 'package:expense_app/utils/routes/routes.dart';
import 'package:expense_app/utils/themes/text-style.dart';
import 'package:expense_app/utils/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash/splash_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0), weight: 1),
    ]).animate(controller);
    controller.forward();

    controller.addStatusListener((status) {
      print("status => $status");
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, Routes.loginScreen);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Center(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, widget) {
                return Opacity(opacity: animation.value, child: widget);
              },
              child: AppTextTheme.text(
                "Welcome to Expense App",
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
