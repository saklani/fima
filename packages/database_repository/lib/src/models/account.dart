import 'package:equatable/equatable.dart';

import '../enums/enums.dart';
import 'transaction.dart';

class Account extends Equatable {
  final String id;
  final String nickname;
  final BigInt balance;
  final AccountType accountType;
  final List<Transaction> transactions;

  Account({
    required this.id,
    required this.nickname,
    required this.balance,
    required this.accountType,
    required this.transactions,
  });

  @override
  List<Object?> get props => [id, nickname, balance];
}
