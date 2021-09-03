import 'dart:io';

import 'package:eshiblood/src/auth/data_provider/auth_data_provider.dart';
import 'package:eshiblood/src/auth/models/user_model.dart';
// import 'package:eshiblood/src/auth/models/user_model.dart';
// import 'package:meta/meta.dart';

class AuthRepository {
  final AuthProvider authProvider;

  AuthRepository({required this.authProvider});

  // Future<void> signUp(User user) async {
  //   print('hey');
  //   return await dataProvider.signUp(user);
  // }
  Future<dynamic> signup(dynamic profile) async {
    print("hey from repo signup");
    return await authProvider.signup(profile);
  }

  Future<User> login(String phone, String password) async {
    print('hey from repo');
    return await authProvider.login(phone, password);
  }
}
