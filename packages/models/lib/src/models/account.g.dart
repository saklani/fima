// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      balance: BigInt.parse(json['balance'] as String),
      accountType: $enumDecode(_$AccountTypeEnumMap, json['accountType']),
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'balance': instance.balance.toString(),
      'accountType': _$AccountTypeEnumMap[instance.accountType]!,
      'transactions': instance.transactions,
    };

const _$AccountTypeEnumMap = {
  AccountType.saving_account: 'saving_account',
  AccountType.wallet: 'wallet',
};
