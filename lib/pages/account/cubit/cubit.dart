import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:database_repository/database_repository.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AuthenticationRepository authenticationRepository;
  final DatabaseRepository databaseRepository;
  final Account account;

  AccountCubit(
      this.authenticationRepository, this.databaseRepository, this.account)
      : super(AccountState());

  Future<List<Transaction>> getTransactions() async {
    List<Transaction> transactions = [];
    emit(state.copyWith(status: AccountStatus.loading));
    try {
      User? user = await authenticationRepository.user.first;
      transactions = await databaseRepository.getTransactions(
        user: user!,
        accountId: account.id,
      );
      emit(
        state.copyWith(
          account: account,
          transactions: transactions,
          status: AccountStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.error));
    }
    return transactions;
  }
}
