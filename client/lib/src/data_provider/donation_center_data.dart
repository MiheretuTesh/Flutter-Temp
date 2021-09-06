import 'dart:convert';
import '../../links.dart';
import '../../dioInstance.dart' as customDio;
import '../models/donation_center.dart';

class DonationCenterDataProvider {
  
  final dio = customDio.dio;

  Future<DonationCenter> createDonationCenter(DonationCenter donationCenter) async {
    final response = await dio.post("/DonationCenters",
        data: jsonEncode(<String, dynamic>{
          "address": donationCenter.address,
          "name": donationCenter.name,
          "timeSlot": donationCenter.timeSlot,          
        }));

    if (response.statusCode == 201 || response.statusCode == 200) {
      
      return DonationCenter.fromJson(response.data["donationCenter"]);
    } else {
      print(response.statusMessage);
      throw Exception("Failed to Load DonationCenter");
    }
  }

  Future<List<DonationCenter>> getDonationCenters() async {
    // print("ggggggggeeeeeeeeeeeeeettttttttttttt");
    final response = await dio.get("/DonationCenters");
    if (response.statusCode == 200) {
      // print(response.data["result"]["docs"]);
      final donationCenters = response.data["result"]["docs"] as List;
      // print(donationCenters);
      print("DonationCenters ***********************");
      return donationCenters.map((donationCenter) => DonationCenter.fromJson(donationCenter)).toList();
    } else {
      throw Exception("Failed To Load DonationCenters");
    }
  }
  Future<DonationCenter> getDonationCenter(String id) async {
    final response = await dio.get("/DonationCenters/$id");
    if (response.statusCode == 200) {
      // print(response.data["result"]["docs"]);
      final donationCenter = response.data["donationCenter"];
      // print(donationCenters);
      print("DonationCenter ************ $id  ***********");
      return DonationCenter.fromJson(donationCenter);
    } else {
      throw Exception("Failed To Load DonationCenters");
    }
  }

  Future<void> deleteDonationCenter(String id) async {
    final response = await dio.delete("/DonationCenters/$id");
    if (response.statusCode != 200) {
      throw Exception("Failed to delete DonationCenter");
    }
  }

  Future<DonationCenter> updateDonationCenter(DonationCenter donationCenter) async {
    final response = await dio.patch("/DonationCenters/${donationCenter.id}",
        data: jsonEncode(<String, dynamic>{
          "address": donationCenter.address,
          "name": donationCenter.name,
          "status": donationCenter.status,
          "timeSlot": donationCenter.timeSlot,
        }));

    if (response.statusCode == 200) {
      print("tried to access from json ************************");
      return DonationCenter.fromJson(response.data["donationCenter"]);
    } else {
      throw Exception("Failed to Update DonationCenter******");
    }
  }
}
