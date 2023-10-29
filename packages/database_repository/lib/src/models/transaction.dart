import 'package:equatable/equatable.dart';

import '../enums/enums.dart';

class Transaction extends Equatable {
  final String id;
  final BigInt amount;
  final TransactionType transactionType;

  const Transaction({
    required this.id,
    required this.amount,
    required this.transactionType,
  });

  @override
  List<Object?> get props => [id, amount, transactionType];
}
