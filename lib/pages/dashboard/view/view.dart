import 'package:authentication_repository/authentication_repository.dart';
import 'package:database_repository/database_repository.dart';
import 'package:fima/pages/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/dashboard_cubit.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static Page<void> page() => const MaterialPage<void>(child: Dashboard());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => DashboardCubit(context.read<AuthenticationRepository>(), context.read<DatabaseRepository>())..getAccounts(),
        child: DashboardView(),
      ),
    );
  }
}
