import 'package:eshiblood/src/models/request.dart';
import 'package:eshiblood/src/repository/request_repository.dart';
import 'package:eshiblood/src/screens/request_detail.dart';
import 'package:eshiblood/src/screens/donation_card_screen.dart';
import 'package:eshiblood/src/screens/welcome_screen.dart';
import './screens/registration_screen.dart';
import 'package:flutter/material.dart';

import 'data_provider/request_data.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var x = RequestRepository(dataProvider: RequestDataProvider());
    // print(x.getRequests());
    // x.createRequest(Request( unitsNeeded: 10, reason: "reason 122222", bloodType: "A+"));
    // 61347a2d31d33f9c4ad7bc2d
    // x.updateRequest(Request(id: "6134906a8939b8fcbae7781b", unitsNeeded: 10, reason: "reason updated", bloodType: "AB+", status: "Active"));
    x.deleteRequest("6134906a8939b8fcbae7781b");
    return MaterialApp(
      home: RequestDetail(),
    );
  }
}
