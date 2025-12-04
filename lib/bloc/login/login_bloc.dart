import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_app/bloc/common_states/text-fields-state.dart';
import 'package:expense_app/bloc/common_states/text-fields-validation-state.dart';
import 'package:expense_app/utils/constants/debug_log_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
    : super(
        LoginState(
          fieldsState: LoginFieldsState(
            mobileNumberFieldState: TextFieldState(
              textEditingController: TextEditingController(),
              textFieldValidationState: TextFieldValidationState.empty(),
            ),
            passwordFieldState: TextFieldState(
              textEditingController: TextEditingController(),
              textFieldValidationState: TextFieldValidationState.empty(),
            ),
          ),
        ),
      ) {
    on<LoginThroughGoogleEvent>((event, emit) async {
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();
      debugLog("googleUser => $googleUser");

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      debugLog("googleAuth => $googleAuth");

      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
      debugLog("credential => $credential");

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      debugLog("userCredential => $userCredential");

      emit(state.copyWith(userCredential: userCredential));
    });
  }
}
