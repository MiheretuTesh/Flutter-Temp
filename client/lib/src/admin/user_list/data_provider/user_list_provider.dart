import 'package:dio/dio.dart';
import 'package:eshiblood/src/auth/models/user_model.dart';
import 'package:eshiblood/src/auth/repository/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListProvider {
  final _baseUrl = '192.168.1.13:8000';

  UserListProvider();

  Future<List<User>> getUserList() async {
    try {
      print(await SecureStorage().getToken());
      print('Fetching Start User list data provider...');
      var token = await SecureStorage().getToken();
      var response = await Dio().get('http://${_baseUrl}/api/v1/users',
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          }));
      // print('Response ${response.data}');
      if (response.statusCode == 200) {
        print('-------------------> Done');
        // print(response.data["result"]["docs"]);
        final users = response.data["result"]["docs"] as List;
        // Map<String, dynamic> users = response.data["result"]["docs"];

        return users.map((user) => User.fromJson(user)).toList();
      } else {
        throw Exception('Fetching Failed User list data provider...');
      }
      // print(await SecureStorage().hasToken());
      // print(response.data);

    } catch (e) {
      // print('Fetching Failed User list data provider...');
      throw Exception('Fetching Failed User list data provider...');
    }
  }
}
