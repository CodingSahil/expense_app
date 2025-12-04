import 'package:equatable/equatable.dart';

class TextFieldValidationState extends Equatable {
  const TextFieldValidationState({required this.isError, this.errorMessage});

  final bool isError;
  final String? errorMessage;

  TextFieldValidationState copyWith({bool? isError, String? errorMessage}) {
    return TextFieldValidationState(isError: isError ?? this.isError, errorMessage: errorMessage ?? this.errorMessage);
  }

  TextFieldValidationState empty() {
    return const TextFieldValidationState(isError: false, errorMessage: null);
  }

  factory TextFieldValidationState.empty() {
    return const TextFieldValidationState(isError: false, errorMessage: null);
  }

  @override
  List<Object?> get props => [isError, errorMessage];
}
