import 'package:authentication_repository/authentication_repository.dart';
import 'package:database_repository/database_repository.dart';
import 'package:fima/pages/add_account/cubit/add_account_cubit.dart';
import 'package:fima/pages/add_account/view/add_account_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAccountView extends StatelessWidget {
  const AddAccountView({super.key});

  static PageRoute<void> route() =>
      MaterialPageRoute(builder: (_) => AddAccountView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => AddAccountCubit(
          context.read<AuthenticationRepository>(),
          context.read<DatabaseRepository>(),
        ),
        child: AddAccountForm(),
      ),
    );
  }
}
