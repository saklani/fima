import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
import 'transaction.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Account with _$Account {
  factory Account({
    required String id,
    required String nickname,
    required BigInt balance,
    required AccountType accountType
  }) = _Account;

  factory Account.fromJson(Map<String, Object?> data) =>
      _$AccountFromJson(data);
}
