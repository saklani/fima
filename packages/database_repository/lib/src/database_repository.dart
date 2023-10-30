import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:models/models.dart';
import 'package:uuid/uuid.dart';

class DatabaseRepository {
  final FirebaseFirestore _firestore;

  DatabaseRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<Account> createAccount({
    required User user,
    required String nickname,
    required BigInt currentBalance,
    required AccountType accountType,
  }) async {
    Account account = Account(
        id: Uuid().v4(),
        nickname: nickname,
        balance: currentBalance,
        accountType: accountType);
    try {
      await _firestore
          .collection(user.id)
          .doc(account.id)
          .set(account.toJson());
    } catch (e) {}
    return account;
  }

  Future<Account> updateAccount({
    required User user,
    required String id,
    String? nickname,
    BigInt? currentBalance,
  }) async {
    Account account = await getAccount(user: user, id: id);
    Account newAccount = account.copyWith(
      nickname: nickname ?? account.nickname,
      balance: currentBalance ?? account.balance,
    );
    try {
      await _firestore
          .collection(user.id)
          .doc(account.id)
          .update(newAccount.toJson());
    } catch (e) {}
    return newAccount;
  }

  Future<Account> getAccount({required User user, required String id}) async {
    Map<String, dynamic>? data;
    try {
      final snapshot = await _firestore.collection(user.id).doc(id).get();
      data = snapshot.data();
    } catch (e) {}
    if (data == null) throw Error();
    return Account.fromJson(data);
  }

  Future<List<Account>> getAccounts({required User user}) async {
    List<Account> accounts = [];
    try {
      final snapshot = await _firestore.collection(user.id).get();
      snapshot.docs.forEach(
          (document) => accounts.add(Account.fromJson(document.data())));
    } catch (e) {}
    return accounts;
  }

  Future<void> deleteAccount({required User user, required String id}) async {
    try {
      await _firestore.collection(user.id).doc(id).delete();
    } catch (e) {}
  }

  Future<Transaction> createTransaction({
    required User user,
    required String name,
    required String accountId,
    required BigInt amount,
    required TransactionType transactionType,
  }) async {
    Transaction transaction = Transaction(
      id: Uuid().v4(),
      name: name,
      amount: amount,
      transactionType: transactionType,
    );
    try {
      await _firestore
          .collection(user.id)
          .doc(accountId)
          .collection("transactions")
          .doc(transaction.id)
          .set(transaction.toJson());
    } catch (e) {}
    return transaction;
  }

  Future<Transaction> updateTransaction({
    required User user,
    required String accountId,
    required String transactionId,
    String? name,
    BigInt? amount,
    TransactionType? transactionType,
  }) async {
    Transaction transaction = await getTransaction(
      user: user,
      accountId: accountId,
      transactionId: transactionId,
    );
    Transaction newTransaction = transaction.copyWith(
      name: name ?? transaction.name,
      amount: amount ?? transaction.amount,
      transactionType: transactionType ?? transaction.transactionType,
    );
    try {
      await _firestore
          .collection(user.id)
          .doc(accountId)
          .collection("transactions")
          .doc(transactionId)
          .update(newTransaction.toJson());
    } catch (e) {}
    return newTransaction;
  }

  Future<Transaction> getTransaction({
    required User user,
    required String accountId,
    required String transactionId,
  }) async {
    Map<String, dynamic>? data;
    try {
      final snapshot = await _firestore
          .collection(user.id)
          .doc(accountId)
          .collection("transactions")
          .doc(transactionId)
          .get();
      data = snapshot.data();
    } catch (e) {}
    if (data == null) throw Error();
    return Transaction.fromJson(data);
  }

  Future<List<Transaction>> getTransactions({
    required User user,
    required String accountId,
  }) async {
    List<Transaction> transactions = [];
    try {
      final snapshot = await _firestore
          .collection(user.id)
          .doc(accountId)
          .collection("transactions")
          .get();
      snapshot.docs.forEach((document) =>
          transactions.add(Transaction.fromJson(document.data())));
    } catch (e) {}
    return transactions;
  }

  Future<void> deleteTransaction({
    required User user,
    required String accountId,
    required String transactionId,
  }) async {
    try {
      await _firestore
          .collection(user.id)
          .doc(accountId)
          .collection("transactions")
          .doc(transactionId)
          .delete();
    } catch (e) {}
  }
}
