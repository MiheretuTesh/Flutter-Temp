import 'package:eshiblood/src/data_provider/donation_center_data.dart';
import 'package:eshiblood/src/models/donation_center.dart';
import 'package:eshiblood/src/models/request.dart';
import 'package:eshiblood/src/repository/donation_center_repository.dart';
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
    // x.deleteRequest("6134906a8939b8fcbae7781b");
    x.getRequests();

    // var y = DonationCenterRepository(dataProvider: DonationCenterDataProvider());
    // print("hellllllllllo");
    // print(y.getDonationCenters());
    // y.createDonationCenter(DonationCenter(
    //   name: "6 kilo dca",
      // timeSlot: {
      //   "startDate": "2021-07-15T13:45:30",
      //   "endDate": "2021-09-15T13:45:30",
      //   "status": "open"
      // },
    //   address: {"state": "Addis Ababa", "city": "Arada", "woreda": "09"},
    // ));

    // TODO caution need timeslot object
    // y.updateDonationCenter(DonationCenter(id:"5d7a514b5d2c12c7449be220" ,name: "Adwa donaC updated", address: {"state": "Addis Ababa", "city": "Arada", "woreda": "09"}));
    // y.deleteDonationCenter("5d7a514b5d2c12c7449be220");
    // y.getDonationCenters();
    return MaterialApp(
      home: RequestDetail(),
    );
  }
}
