import 'package:authentication_repository/authentication_repository.dart';
import 'package:database_repository/database_repository.dart';
import 'package:fima/pages/account/view/account_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/account_cubit.dart';

class AccountPage extends StatelessWidget {
  final Account account;
  const AccountPage({super.key, required this.account});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => AccountCubit(context.read<AuthenticationRepository>(), context.read<DatabaseRepository>(), account)..getTransactions(),
        child: AccountView(),
      ),
    );
  }
}
