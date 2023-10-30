part of 'cubit.dart';

enum DashboardStatus {
  initial,
  loading,
  success,
  error,
}

class DashboardState extends Equatable {
  List<Account>? accounts;
  DashboardStatus status;

  DashboardState({
    this.accounts,
    this.status = DashboardStatus.initial,
  });

  @override
  List<Object?> get props => [accounts, status];

  DashboardState copyWith({List<Account>? accounts, DashboardStatus? status}) {
    return DashboardState(
      accounts: accounts ?? this.accounts,
      status: status ?? this.status,
    );
  }
}
