import 'dart:convert';
import 'package:eshiblood/src/screens/create_request.dart';

import '../../links.dart';
import '../../dioInstance.dart' as customDio;
import '../models/request.dart';
import 'package:http/http.dart' as http;

class RequestDataProvider {
  // final http.Client httpClient;
  final dio = customDio.dio;

  Future<Request> createRequest(Request request) async {
    final response = await dio.post("/requests",
        data: jsonEncode(<String, dynamic>{
          "bloodType": request.bloodType,
          "reason": request.reason,
          "unitsNeeded": request.unitsNeeded,
        }));

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Request.fromJson(response.data["request"]);
    } else {
      print(response.statusMessage);
      throw Exception("Failed to Load Request");
    }
  }

  Future<List<Request>> getRequests() async {
    final response = await dio.get("/requests");
    if (response.statusCode == 200) {
      // print(response.data["result"]["docs"]);
      final requests = response.data["result"]["docs"] as List;
      print("requests ***********************");
      return requests.map((request) => Request.fromJson(request)).toList();
    } else {
      // print("heeeeeeeeeeeeeeeeeeeeeeeeeeeeeelo");
      throw Exception("Failed To Load Requests");
    }
  }

  Future<Request> getRequest(String id) async {
    final response = await dio.get("/requests/$id");

    if (response.statusCode == 200) {
      return Request.fromJson(response.data["request"]);
    } else {
      throw Exception("Failed to Update Request******");
    }
  }

  Future<void> deleteRequest(String id) async {
    final response = await dio.delete("/requests/${id}");
    if (response.statusCode != 200) {
      throw Exception("Failed to delete Request");
    }
  }

  Future<Request> updateRequest(Request request) async {
    final response = await dio.patch("/requests/${request.id}",
        data: jsonEncode(<String, dynamic>{
          "bloodType": request.bloodType,
          "reason": request.reason,
          "unitsNeeded": request.unitsNeeded,
          "status": request.status
        }));

    if (response.statusCode == 200) {
      return Request.fromJson(response.data["request"]);
    } else {
      throw Exception("Failed to Update Request******");
    }
  }
}
