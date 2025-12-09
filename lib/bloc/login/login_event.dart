part of 'login_bloc.dart';

abstract class LoginEvent {}

class SendOTP extends LoginEvent {
  SendOTP({required this.isClicked, required this.context});

  final BuildContext context;
  final bool isClicked;
}

class FieldValidation extends LoginEvent {}

class LoginThroughGoogleEvent extends LoginEvent {
  LoginThroughGoogleEvent({required this.context});

  final BuildContext context;
}
