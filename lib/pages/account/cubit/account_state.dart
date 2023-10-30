part of 'account_cubit.dart';

enum AccountStatus {
  initial,
  loading,
  success,
  error,
}

class AccountState extends Equatable {
  Account? account;
  List<Transaction>? transactions;
  AccountStatus status;

  AccountState({
    this.account,
    this.transactions,
    this.status = AccountStatus.initial,
  });

  @override
  List<Object?> get props => [account, transactions, status];

  AccountState copyWith(
      {Account? account,
      List<Transaction>? transactions,
      AccountStatus? status}) {
    return AccountState(
      account: account ?? this.account,
      transactions: transactions ?? this.transactions,
      status: status ?? this.status,
    );
  }
}
