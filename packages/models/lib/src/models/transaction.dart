import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  factory Transaction({
    required String id,
    required BigInt amount,
    required TransactionType transactionType,
  }) = _Transaction;


  factory Transaction.fromJson(Map<String, Object?> json)
  => _$TransactionFromJson(json);
}
