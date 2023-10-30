import 'package:database_repository/database_repository.dart';
import 'package:fima/pages/account/account.dart';
import 'package:fima/pages/add_account/view/add_account_view.dart';
import 'package:fima/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:fima/styles/buttons.dart';
import 'package:fima/styles/spacing.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Spacer(),
                _SignOutButton(),
              ],
            ),
            xlSpacing,
            Text(
              "Accounts",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: _AccountGrid(),
            ),
            _AddAccountButton(),
          ],
        ),
      ),
    );
  }
}

class _AccountGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return switch (state.status) {
          DashboardStatus.initial => Center(
              child: CircularProgressIndicator(),
            ),
          DashboardStatus.loading => Center(
              child: CircularProgressIndicator(),
            ),
          DashboardStatus.success =>
            state.accounts != null && state.accounts!.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: state.accounts?.length ?? 0,
                    itemBuilder: (context, index) {
                      Account account = state.accounts![index];
                      return Card(
                        color: Colors.green.shade400,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => AccountPage(account: account)));
                            },
                            child: GridTile(
                              child: Text(
                                "\$ ${(account.balance / BigInt.from(100))
                                    .toStringAsFixed(2)}",
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              footer: Text(
                                account.nickname,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Text("Add an Account to Start Tracking"),
          DashboardStatus.error => Text(
              "Something Went Wrong",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.apply(color: Colors.red),
            ),
        };
      },
    );
  }
}

class _AddAccountButton extends StatelessWidget {
  const _AddAccountButton({super.key});
  @override
  Widget build(BuildContext context) {
    return RoundedButton(
        label: "Add Account",
        onPressed: () =>
            Navigator.of(context).push<void>(AddAccountView.route()));
  }
}

class _SignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () => context.read<DashboardCubit>().signOut(),
          icon: Icon(Icons.logout),
        );
      },
    );
  }
}
