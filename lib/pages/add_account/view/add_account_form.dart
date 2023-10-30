import 'package:fima/styles/buttons.dart';
import 'package:fima/styles/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../cubit/add_account_cubit.dart';

class AddAccountForm extends StatelessWidget {
  const AddAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAccountCubit, AddAccountState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            xlSpacing,
            Text(
              "Add an Account to Track",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            xlSpacing,
            _NicknameInput(),
            spacing,
            _BalanceInput(),
            spacing,
            _SaveButton(),
          ],
        ),
      ),
    );
  }
}

class _NicknameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAccountCubit, AddAccountState>(
      buildWhen: (previous, current) => previous.nickname != current.nickname,
      builder: (context, state) {
        return TextField(
          onChanged: (email) =>
              context.read<AddAccountCubit>().nicknameChanged(email),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Nickname',
            helperText: '',
            errorText:
                state.nickname.displayError != null ? 'invalid nickname' : null,
          ),
        );
      },
    );
  }
}

class _BalanceInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAccountCubit, AddAccountState>(
      buildWhen: (previous, current) => previous.balance != current.balance,
      builder: (context, state) {
        return TextField(
          onChanged: (balance) => context
              .read<AddAccountCubit>()
              .balanceChanged(int.parse(balance)),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: 'Balance',
            helperText: '',
            errorText:
                state.balance.displayError != null ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}


class _SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAccountCubit, AddAccountState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(),
              )
            : RoundedButton(
                onPressed: () {
                  if (state.isValid) {
                    context.read<AddAccountCubit>().createAccount();
                    Navigator.of(context).pop();
                  }
                },
                label: "SAVE",
              );
      },
    );
  }
}
