import 'package:equatable/equatable.dart';
import 'package:expense_app/bloc/common_states/text-fields-validation-state.dart';
import 'package:flutter/cupertino.dart';

class TextFieldState extends Equatable {
  const TextFieldState({required this.textEditingController, required this.textFieldValidationState});

  final TextEditingController textEditingController;
  final TextFieldValidationState textFieldValidationState;

  TextFieldState copyWith({
    TextEditingController? textEditingController,
    TextFieldValidationState? textFieldValidationState,
  }) {
    return TextFieldState(
      textEditingController: textEditingController ?? this.textEditingController,
      textFieldValidationState: textFieldValidationState ?? this.textFieldValidationState,
    );
  }

  @override
  List<Object?> get props => [textEditingController, textFieldValidationState];
}
