import 'package:eshiblood/src/admin/user_list/bloc/user_list_bloc.dart';
import 'package:eshiblood/src/auth/bloc/auth_bloc.dart';
import 'package:eshiblood/src/auth/bloc/login_bloc.dart';
import 'package:eshiblood/src/auth/bloc/signup_bloc.dart';
import 'package:eshiblood/src/auth/data_provider/auth_data_provider.dart';
import 'package:eshiblood/src/auth/repository/auth_repository.dart';
import 'package:eshiblood/src/auth/repository/secure_storage.dart';
import 'package:eshiblood/src/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'admin/user_list/data_provider/user_list_provider.dart';
import 'admin/user_list/repository/user_list_repository.dart';

class App extends StatelessWidget {
  final authRepo = AuthRepository(authProvider: AuthProvider());
  final userRepository = SecureStorage();
  final userListRepository =
      UserListRepository(userListProvider: UserListProvider());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                UserListBloc(userListRepository: userListRepository)),
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
        initialRoute: RouteGenerator.welcomeScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
