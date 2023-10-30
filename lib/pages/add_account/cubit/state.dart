part of 'cubit.dart';

class AddAccountState extends Equatable {

  const AddAccountState({
    this.nickname = const Nickname.pure(),
    this.balance = const Balance.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final Nickname nickname;
  final Balance balance;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  @override
  List<Object?> get props => [nickname, balance, isValid];

  AddAccountState copyWith({
    Nickname? nickname,
    Balance? balance,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return AddAccountState(
      nickname: nickname ?? this.nickname,
      balance: balance ?? this.balance,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
