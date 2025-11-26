import 'package:expense_app/utils/themes/text-style.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(child: AppTextTheme.text("Login", color: Theme.of(context).colorScheme.onSurface)),
    );
  }
}
