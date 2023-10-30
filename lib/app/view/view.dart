import 'package:authentication_repository/authentication_repository.dart';
import 'package:database_repository/database_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors.dart';
import '../bloc/app_bloc.dart';
import '../routes.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    required DatabaseRepository databaseRepository,
    super.key,
  })  : _authenticationRepository = authenticationRepository,
        _databaseRepository = databaseRepository;

  final AuthenticationRepository _authenticationRepository;
  final DatabaseRepository _databaseRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>.value(
          value: _authenticationRepository,
        ),
        RepositoryProvider<DatabaseRepository>.value(
          value: _databaseRepository,
        ),
      ],
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: zeus),
          shape: const Border(
            bottom: BorderSide(color: Colors.grey, width: 0.25),
          ),
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 17.5,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.75,
            color: antracite,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 3,
          backgroundColor: Colors.white,
          selectedItemColor: zeus,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Colors.green.shade700),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: const IconThemeData(color: Colors.grey, size: 16),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: zeus,
              width: 0.25,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: zeus,
          elevation: 1,
        ),
        iconTheme: const IconThemeData(
          color: zeus,
          size: 16,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: antracite, width: 1)),
        ),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.poppins(
            fontSize: 36.0,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: GoogleFonts.poppins(
            fontSize: 23.0,
            fontWeight: FontWeight.w600,
            color: zeus,
          ),
          headlineSmall: GoogleFonts.poppins(
            fontSize: 17.5,
            fontWeight: FontWeight.w600,
            color: zeus,
            letterSpacing: 0.75,
          ),
          labelSmall: GoogleFonts.poppins(
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 15.0,
            fontWeight: FontWeight.w200,
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 14.0,
          ),
        ),
        cardColor: appleGrey,
        dialogBackgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        secondaryHeaderColor: zeus,
      ),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
