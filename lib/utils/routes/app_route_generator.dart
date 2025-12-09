import 'package:expense_app/screens/auth/login_view.dart';
import 'package:expense_app/screens/auth/otp_verification_view.dart';
import 'package:expense_app/screens/splash_view.dart';
import 'package:expense_app/utils/routes/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (context) => LoginView());

    case Routes.otpVerificationView:
      return MaterialPageRoute(builder: (context) => OtpVerificationView());

    default:
      return MaterialPageRoute(builder: (context) => SplashView());
  }
}
