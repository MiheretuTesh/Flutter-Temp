import 'package:eshiblood/src/auth/bloc/auth_bloc.dart';
import 'package:eshiblood/src/auth/bloc/login_bloc.dart';
import 'package:eshiblood/src/auth/bloc/signup_bloc.dart';
import 'package:eshiblood/src/auth/data_provider/auth_data_provider.dart';
import 'package:eshiblood/src/auth/repository/auth_repository.dart';
import 'package:eshiblood/src/auth/repository/secure_storage.dart';
import 'package:eshiblood/src/user/screens/donation_card_screen.dart';
import 'package:eshiblood/src/user/screens/donation_history_screen.dart';
import 'package:eshiblood/src/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class App extends StatelessWidget {
  final authRepo = AuthRepository(authProvider: AuthProvider());
  final userRepository = SecureStorage();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AuthenticationBloc(userRepository: userRepository)),
        BlocProvider(
          create: (context) => SignUpBloc(
              authRepo: authRepo,
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        ),
        BlocProvider(
          create: (context) => LoginBloc(
              authRepository: authRepo,
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        ),
      ],
      child: MaterialApp(
        initialRoute: RouteGenerator.homeScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
