import 'package:expense_app/bloc/common_states/initializer.dart';
import 'package:expense_app/utils/routes/app_route_generator.dart';
import 'package:expense_app/utils/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

late InternalInitializerState initializer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleSignIn.instance.initialize(
    clientId: "248699077106-ju3dpusqd4r4sa0pk1311slhkti5vtoe.apps.googleusercontent.com",
    serverClientId: "248699077106-b9gqaos64fdl3i0oqtss365l2ltud1e0.apps.googleusercontent.com"
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  initializer = InternalInitializerState.init(pref: sharedPreferences);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: initializer.providers,
      child: MaterialApp(
        title: 'Expense App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        theme: MaterialTheme().dark(),
      ),
    );
  }
}
