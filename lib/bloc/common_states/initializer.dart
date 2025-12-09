import 'package:expense_app/bloc/login/login_bloc.dart';
import 'package:expense_app/bloc/splash/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternalInitializerState {
  const InternalInitializerState({required this.providers, required this.sharedPreferences});

  final List<BlocProvider> providers;
  final SharedPreferences sharedPreferences;

  factory InternalInitializerState.init({required SharedPreferences pref}) {
    return InternalInitializerState(
      sharedPreferences: pref,
      providers: [
        BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
      ],
    );
  }
}
