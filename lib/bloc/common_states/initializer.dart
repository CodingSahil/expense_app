import 'package:expense_app/bloc/login/login_bloc.dart';
import 'package:expense_app/bloc/splash/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternalInitializerState {
  const InternalInitializerState({required this.providers});

  final List<BlocProvider> providers;

  factory InternalInitializerState.init() {
    return InternalInitializerState(
      providers: [
        BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
      ],
    );
  }
}
