import 'package:database_repository/database_repository.dart';
import 'package:fima/pages/account/cubit/account_cubit.dart';
import 'package:fima/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:fima/styles/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../styles/buttons.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "Account",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            xlSpacing,
            _AccountInformation(),
            xlSpacing,
            Text(
              "Transactions",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountInformation extends StatelessWidget {
  const _AccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
      return Column(
        children: [
          Text(
            state.account?.nickname ?? "",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            "\$ ${(state.account?.balance ?? BigInt.zero) / BigInt.from(100)}",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      );
    });
  }
}

// class _TransactionList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DashboardCubit, DashboardState>(
//       builder: (context, state) {
//         return switch (state.status) {
//           DashboardStatus.initial => Center(
//               child: CircularProgressIndicator(),
//             ),
//           DashboardStatus.loading => Center(
//               child: CircularProgressIndicator(),
//             ),
//           DashboardStatus.success =>
//             state.accounts != null && state.accounts!.isNotEmpty
//                 ? GridView.builder(
//                     shrinkWrap: true,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                     ),
//                     itemCount: state.accounts?.length ?? 0,
//                     itemBuilder: (context, index) {
//                       Account account = state.accounts![index];
//                       return Card(
//                         color: Colors.green.shade400,
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: GridTile(
//                             child: Text(
//                               "\$ ${(account.balance / BigInt.from(100)).toStringAsFixed(2)}",
//                               style: Theme.of(context).textTheme.headlineSmall,
//                             ),
//                             footer: Text(
//                               account.nickname,
//                               style: Theme.of(context).textTheme.bodyLarge,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 : Text("Add an Account to Start Tracking"),
//           DashboardStatus.error => Text(
//               "Something Went Wrong",
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium
//                   ?.apply(color: Colors.red),
//             ),
//         };
//       },
//     );
//   }
// }

// class _AddTransactionButton extends StatelessWidget {
//   const _AddTransactionButton({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return RoundedButton(
//         label: "Add Transactions",
//         onPressed: () =>
//             Navigator.of(context).push<void>(AddAccountView.route()));
//   }
// }
