import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:database_repository/src/enums/account_type.dart';
import 'package:uuid/uuid.dart';

import 'models/models.dart';

class DatabaseRepository {
  final FirebaseFirestore _firestore;

  DatabaseRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> createAccount({
    required User user,
    required String nickname,
    required BigInt currentBalance,
    required AccountType accountType,
  }) async {
    try {
      Account account = Account(
        id: Uuid().v4(),
        nickname: nickname,
        balance: currentBalance,
        accountType: accountType,
        transactions: [],
      );
      _firestore.collection(user.id).doc(account.id).set();
    } catch (e) {}
  }

  Future<Account> updateAccount() async {
    throw UnimplementedError();
  }

  Future<List<Account>> getAccount() async {
    throw UnimplementedError();
  }

  Future<Account> deleteAccount() async {
    throw UnimplementedError();
  }

  Future<void> createTransaction() async {
    throw UnimplementedError();
  }

  Future<Transaction> updateTransaction() async {
    throw UnimplementedError();
  }

  Future<List<Transaction>> getTransaction() async {
    throw UnimplementedError();
  }

  Future<Transaction> deleteTransaction() async {
    throw UnimplementedError();
  }
}
