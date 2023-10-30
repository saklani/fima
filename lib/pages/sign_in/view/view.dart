import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/sign_in_cubit.dart';
import 'sign_in_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SignInView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => SignInCubit(context.read<AuthenticationRepository>()),
        child: const SignInForm(),
      ),
    );
  }
}