import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:database_repository/database_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../form/name.dart';
import '../form/balance.dart';
part 'add_account_state.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  final AuthenticationRepository _authenticationRepository;
  final DatabaseRepository _databaseRepository;

  AddAccountCubit(this._authenticationRepository, this._databaseRepository)
      : super(AddAccountState());
  void nicknameChanged(String value) {
    final nickname = Nickname.dirty(value);
    emit(
      state.copyWith(
        nickname: nickname,
        isValid: Formz.validate([nickname, state.balance]),
      ),
    );
  }

  void balanceChanged(int value) {
    final balance = Balance.dirty(value);
    emit(
      state.copyWith(
        balance: balance,
        isValid: Formz.validate([state.nickname, balance]),
      ),
    );
  }

  Future<void> createAccount() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      User user = await _authenticationRepository.currentUser!;
      _databaseRepository.createAccount(
        user: user,
        nickname: state.nickname.value,
        currentBalance: BigInt.from(state.balance.value),
        accountType: AccountType.wallet,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
