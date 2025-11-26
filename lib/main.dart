import 'package:expense_app/utils/routes/app_route_generator.dart';
import 'package:expense_app/utils/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/splash/splash_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<SplashCubit>(create: (context) => SplashCubit())],
      child: MaterialApp(
        title: 'Expense App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        theme: MaterialTheme().dark(),
      ),
    );
  }
}
