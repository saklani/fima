import 'package:formz/formz.dart';

enum NameValidationError { invalid }

/// Form input for an name input.
class Nickname extends FormzInput<String, NameValidationError> {
  const Nickname.pure() : super.pure('');

  const Nickname.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    return value != null && value.isNotEmpty
        ? null
        : NameValidationError.invalid;
  }
}
