part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.buttonLoader = false,
    this.clickedOnLoginButton = false,
    required this.fieldsState,
    this.userCredential,
  });

  final bool buttonLoader;
  final bool clickedOnLoginButton;
  final LoginFieldsState fieldsState;
  final UserCredential? userCredential;

  LoginState copyWith({
    bool? buttonLoader,
    bool? clickedOnLoginButton,
    LoginFieldsState? fieldsState,
    UserCredential? userCredential,
  }) {
    return LoginState(
      buttonLoader: buttonLoader ?? this.buttonLoader,
      clickedOnLoginButton: clickedOnLoginButton ?? this.clickedOnLoginButton,
      fieldsState: fieldsState ?? this.fieldsState,
      userCredential: userCredential ?? this.userCredential,
    );
  }

  @override
  List<Object?> get props => [buttonLoader, clickedOnLoginButton, fieldsState, userCredential];
}

class LoginFieldsState extends Equatable {
  const LoginFieldsState({required this.mobileNumberFieldState});

  final TextFieldState mobileNumberFieldState;

  LoginFieldsState copyWith({TextFieldState? mobileNumberFieldState, TextFieldState? passwordFieldState}) {
    return LoginFieldsState(
      mobileNumberFieldState: mobileNumberFieldState ?? this.mobileNumberFieldState,
    );
  }

  @override
  List<Object?> get props => [mobileNumberFieldState,];
}
