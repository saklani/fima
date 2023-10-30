import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:database_repository/database_repository.dart';
import 'package:fima/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  final databaseRepository = DatabaseRepository();

  runApp(
    App(
      authenticationRepository: authenticationRepository,
      databaseRepository: databaseRepository,
    ),
  );
}
