import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_app/bloc/common_states/text-fields-state.dart';
import 'package:expense_app/bloc/common_states/text-fields-validation-state.dart';
import 'package:expense_app/utils/constants/debug_log_function.dart';
import 'package:expense_app/utils/widgets/snackbar.dart';
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
          ),
        ),
      ) {
    FirebaseAuth auth = FirebaseAuth.instance;

    on<LoginThroughGoogleEvent>((event, emit) async {
      try {
        final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();
        debugLog("googleUser => $googleUser");

        final GoogleSignInAuthentication googleAuth = googleUser.authentication;
        debugLog("googleAuth => $googleAuth");

        final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
        debugLog("credential => $credential");

        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        debugLog("userCredential => ${userCredential.user}");

        emit(state.copyWith(userCredential: userCredential));
      } on Exception catch (e) {
        errorSnackBar(context: event.context, message: e.toString());
      }
    });

    on<FieldValidation>((event, emit) {
      String mobileNumberString = state.fieldsState.mobileNumberFieldState.textEditingController.text;
      TextFieldValidationState mobileNumberValidationState;
      if (mobileNumberString.isEmpty) {
        mobileNumberValidationState = TextFieldValidationState(isError: true, errorMessage: "Mobile Number is required");
      } else if (mobileNumberString.isNotEmpty && mobileNumberString.length < 10) {
        mobileNumberValidationState = TextFieldValidationState(
          isError: true,
          errorMessage: "Please Enter Valid Mobile Number",
        );
      } else {
        mobileNumberValidationState = TextFieldValidationState.empty();
      }

      emit(
        state.copyWith(
          fieldsState: state.fieldsState.copyWith(
            mobileNumberFieldState: state.fieldsState.mobileNumberFieldState.copyWith(
              textFieldValidationState: mobileNumberValidationState,
            ),
          ),
        ),
      );
    });

    on<SendOTP>((event, emit) async {
      emit(state.copyWith(clickedOnLoginButton: event.isClicked, buttonLoader: true));

      try {
        await auth.verifyPhoneNumber(
          phoneNumber: "+91${state.fieldsState.mobileNumberFieldState.textEditingController.text}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            // await auth.signInWithCredential(credential);
            print("credential: ${jsonEncode(credential.asMap())}");
          },
          verificationFailed: (FirebaseAuthException error) {
            print("verificationFailed: ${error.toString()}");
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            print("verificationId: $verificationId & forceResendingToken: $forceResendingToken");
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print("verificationId: $verificationId");
          },
        );
        emit(state.copyWith(buttonLoader: false));
      } on Exception catch (e) {
        errorSnackBar(context: event.context, message: e.toString());
        emit(state.copyWith(buttonLoader: false));
      }

      emit(state.copyWith(buttonLoader: false));
    });
  }
}
