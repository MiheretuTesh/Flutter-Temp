import 'dart:convert';

import 'package:eshiblood/links.dart';
import 'package:flutter/material.dart';
import '../../dioInstance.dart' as customDio;

class Request {
  Request({
    this.id,
    required this.unitsNeeded,
    this.totalDonations,
    required this.reason,
    this.status,
    required this.bloodType,
    this.createdBy,
    this.UpdatedBy,
    this.donors,
  });
  String? id;
  int unitsNeeded;
  int? totalDonations;
  String reason;
  String? status;
  String bloodType;
  String? createdBy;
  String? UpdatedBy;
  List<Map>? donors;


  factory Request.fromJson(Map<String, dynamic> json) {
    // print(json);
    // print(json["bloodType"]["bloodTypeName"]);
    // print(json["unitsNeeded"].runtimeType);

    // print();
    print(
        "*********************** Request fromJson ****************************");

    // print(json["totalDonations"]);

    return Request(
      // id: json["_id"],
      unitsNeeded: json["unitsNeeded"],
      totalDonations: json["totalDonations"] ?? 0,
      reason: json["reason"],
      status: json["status"],
      bloodType: json["bloodType"]["bloodTypeName"],
      createdBy: json["createdBy"],
      UpdatedBy: json["UpdatedBy"],
      donors: List<Map>.generate(
          json["donors"].length, (index) => json["donors"][index]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "unitsNeeded": unitsNeeded,
      "totalDonations": totalDonations,
      "reason": reason,
      "status": status,
      "bloodType": bloodType,
      "createdBy": createdBy,
      "UpdatedBy": UpdatedBy,
      "donors": donors,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return """{\n
        _id: $id, \n
        unitsNeeded: $unitsNeeded,\n
        totalDonations: $totalDonations,\n
        reason: $reason,\n
        status: $status,\n
        bloodType: $bloodType,\n
        createdBy: $createdBy,\n
        UpdatedBy: $UpdatedBy,\n
        donors: $donors,\n
    }""";
  }
}
