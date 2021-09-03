// import 'dart:convert';
// import 'package:eshiblood/src/auth/models/user_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eshiblood/src/auth/models/user_model.dart';
// import 'package:path/path.dart';
// import 'package:async/async.dart';
// import 'dart:io';

class AuthProvider {
  final _baseUrl = '192.168.1.13:8000';

  AuthProvider();

  Future<dynamic> signup(dynamic profile) async {
    try {
      print("fetching start..");
      // var response = await Dio().post('http://10.0.2.2:8000/api/v1/users/login',
      //     data: {'phoneNumber': phone, 'password': password});
      // String fileName = profile;
      // FormData formData = FormData.fromMap({
      //   "profile": await MultipartFile.fromFile(profile, filename: fileName)
      // });
      //TODOs : Use Dio dio = new Dio();
      String filename = profile.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          profile.path,
          filename: filename,
        ),
        "firstName": "zzz",
        "lastName": "zzz",
        "dateOfBirth": "aaaa",
        "email": "zzzz@gmail.com",
        "password": "zzzz",
        "phoneNumber": "0918181820",
        "bloodType": "A",
      });

      var response = await Dio().post(
        'http://192.168.1.13:8000/api/v1/users/signup',
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
        print("done");
        return response;
      } else {
        return "phone number already exist";
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> login(String phone, String password) async {
    try {
      print("fetching start..");
      var response = await Dio().post(
          'http://192.168.1.13:8000/api/v1/users/login',
          data: {'phoneNumber': phone, 'password': password});
      if (response.statusCode == 201) {
        User user =
            User.fromJson(jsonDecode(jsonEncode(response.data["user"])));
        print(user);
        // print(jsonDecode(jsonEncode(response.data["user"]))["bloodType"]["bloodTypeName"]);
        return user;
      } else {
        // TODO: Response error
        print(response);
        return null;
      }
    } catch (e) {
      print("fetching failed");
      return null;
    }
  }

  // Future<void> signUp(User user) async {
  //   var request = http.MultipartRequest(
  //       "POST", Uri.parse('http://10.0.2.2:8000/api/v1/users/signup'));

  //   request.fields['firstName'] = "Michael";
  //   request.fields['lastName'] = "Michael";
  //   request.fields['email'] = "Michael";
  //   request.fields['phoneNumber'] = "09100000";R
  //   request.fields['dateOfBirth'] = "Michael";
  //   request.fields['password'] = "Michael";
  //   request.fields['bloodType'] = "5d7a514b5d2c12c7449be041";
  //   request.files.add(await http.MultipartFile.fromPath(
  //       'image', 'assets/images/welcome_background_image.png'));
  //   ;
  //   // var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));

  //   // var multipartFile = new http.MultipartFile('image_file', stream, length, filename: basename(_image.path));
  //   print(request);
  //   request.send().then((response) {
  //     print(response);
  //     if (response.statusCode == 200) {
  //       print('done');
  //     }
  //   }).catchError((e) {
  //     print(e);
  //   });
  // final response = await httpClient.post(
  //   Uri.http('$_baseUrl', '/api/v1/users/signup');
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8'
  //   },
  //   body: jsonEncode(<String, dynamic>{
  //     'phoneNumber': phone,
  //     'password': password,
  //   }),
  // );
  // Map<String, dynamic> userInfo = jsonDecode(response.body);
  // print(userInfo['user']);

  // if (response.statusCode == 200) {
  //   return User.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception('Failed to create user.');
  // }
  // }
}
