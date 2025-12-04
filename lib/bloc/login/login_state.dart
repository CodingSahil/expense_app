part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({this.buttonLoader = false, required this.fieldsState, this.userCredential});

  final bool buttonLoader;
  final LoginFieldsState fieldsState;
  final UserCredential? userCredential;

  LoginState copyWith({bool? buttonLoader, LoginFieldsState? fieldsState, UserCredential? userCredential}) {
    return LoginState(
      buttonLoader: buttonLoader ?? this.buttonLoader,
      fieldsState: fieldsState ?? this.fieldsState,
      userCredential: userCredential ?? this.userCredential,
    );
  }

  @override
  List<Object?> get props => [buttonLoader, fieldsState, userCredential];
}

class LoginFieldsState extends Equatable {
  const LoginFieldsState({required this.mobileNumberFieldState, required this.passwordFieldState});

  final TextFieldState mobileNumberFieldState;
  final TextFieldState passwordFieldState;

  LoginFieldsState copyWith({TextFieldState? mobileNumberFieldState, TextFieldState? passwordFieldState}) {
    return LoginFieldsState(
      mobileNumberFieldState: mobileNumberFieldState ?? this.mobileNumberFieldState,
      passwordFieldState: passwordFieldState ?? this.passwordFieldState,
    );
  }

  @override
  List<Object?> get props => [mobileNumberFieldState, passwordFieldState];
}
