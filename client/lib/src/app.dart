import 'package:eshiblood/src/auth/bloc/auth_bloc.dart';
import 'package:eshiblood/src/auth/data_provider/auth_data_provider.dart';
import 'package:eshiblood/src/auth/models/user_model.dart';
import 'package:eshiblood/src/auth/repository/auth_repository.dart';
import 'package:eshiblood/src/auth/screens/login_screen.dart';
import 'package:eshiblood/src/auth/screens/registration_screen.dart';
import 'package:eshiblood/src/auth/screens/welcome_screen.dart';
import 'package:eshiblood/src/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class App extends StatelessWidget {
  final authRepo = AuthRepository(authProvider: AuthProvider());
  @override
  Widget build(BuildContext context) {
    // var user = User(
    //     firstName: 'firstName',
    //     lastName: 'lastName',
    //     phoneNumber: 'phoneNumber',
    //     email: 'email',
    //     image: 'image',
    //     dateOfBirth: 'dateOfBirth',
    //     lastDonation: 'lastDonation',
    //     password: 'password');
    // var check = AuthRepository(dataProvider: AuthProvider());
    // // check.signUp(user);
    // check.login('0966303009', 'qwerty123');
    // // check.signUp(user);
    return BlocProvider(
      create: (context) => AuthBloc(authRepo),
      child: MaterialApp(
        initialRoute: RouteGenerator.welcomeScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
