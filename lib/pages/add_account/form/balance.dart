import 'package:formz/formz.dart';

enum BalanceValidationError { invalid }

class Balance extends FormzInput<int, BalanceValidationError> {
  const Balance.pure() : super.pure(0);

  const Balance.dirty([super.value = 0]) : super.dirty();

  @override
  BalanceValidationError? validator(int? value) {
    return value != null && value > 100 ? null : BalanceValidationError.invalid;
  }
}
