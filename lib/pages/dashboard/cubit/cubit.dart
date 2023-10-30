import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:database_repository/database_repository.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final AuthenticationRepository authenticationRepository;
  final DatabaseRepository databaseRepository;

  DashboardCubit(
    this.authenticationRepository,
    this.databaseRepository,
  ) : super(DashboardState());

  Future<List<Account>> getAccounts() async {
    emit(state.copyWith(status: DashboardStatus.loading));
    List<Account> accounts = [];
    try {
      User? user = await authenticationRepository.user.first;
      accounts = await databaseRepository.getAccounts(user: user!);
      emit(
        state.copyWith(
          accounts: accounts,
          status: DashboardStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: DashboardStatus.error));
    }
    return accounts;
  }

  Future<void> signOut() async {
    await authenticationRepository.signOut();
  }
}
