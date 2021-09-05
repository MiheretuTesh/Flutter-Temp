import 'package:dio/dio.dart';

import './links.dart';
final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
        "accept": "/",
        "Authorization": bearer
      },
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );