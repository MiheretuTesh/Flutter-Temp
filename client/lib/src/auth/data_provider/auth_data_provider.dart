import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eshiblood/src/auth/models/user_model.dart';
import 'package:eshiblood/src/auth/models/user_model_json.dart';

class AuthProvider {
  final _baseUrl = '192.168.1.13:8000';

  AuthProvider();

  Future<dynamic> signup(User user) async {
    try {
      print("Fetching Start SignUp Data Provider...");
      String filename = user.image.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          user.image.path,
          filename: filename,
        ),
        "firstName": user.firstName,
        "lastName": user.lastName,
        "dateOfBirth": user.dateOfBirth,
        "email": user.email,
        "password": user.password,
        "phoneNumber": user.phoneNumber,
        "bloodType": user.bloodType,
        "gender": user.gender
      });

      var response = await Dio().post(
        'http://10.0.2.2:8000/api/v1/users/signup',
        data: formData,
        options: Options(
          headers: {
            "accept": "/",
            // For latter use commented
            // "Authorization" : "Bearer nsnadidasnkdw"
            "Content-Type": "multipart/form-data"
          },
        ),
      );
      if (response.statusCode == 201) {
        print("-------------------> Done");
        // print("${response.data["user"]}");
        var user = UserSignIn.fromJson(response.data["user"]);

        Map<String, dynamic> result = {
          "token": response.data["token"],
          "user": user
        };
        // print("${result}");
        return result;
      }
    } catch (e) {
      print("Fetching Failed SignUp Data Provider...");
      return null;
    }
  }

  Future<dynamic> login(String phone, String password) async {
    try {
<<<<<<< HEAD
      print("fetching start..");
      var response = await Dio().post('http://10.0.2.2:8000/api/v1/users/login',
=======
      print("Fetching Start Login Data Provider...");
      var response = await Dio().post(
          'http://192.168.1.13:8000/api/v1/users/login',
>>>>>>> 3b4cbd193b45ed9c3ab60861fcf4ed875eb56211
          data: {'phoneNumber': phone, 'password': password});

      if (response.statusCode == 201) {
        User user =
            User.fromJson(jsonDecode(jsonEncode(response.data["user"])));

        Map<String, dynamic> result = {
          "token": response.data["token"],
          "user": user
        };

        return result;
      }
    } catch (e) {
      print("Fetching Failed Login Data Provider...");
      return null;
    }
  }
}
