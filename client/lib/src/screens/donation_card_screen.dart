import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class _DonationCardScaffold extends StatelessWidget {
  const _DonationCardScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.red,
        body: DonationCard(),
      ),
    );
  }
}

class DonationCard extends StatelessWidget {
  const DonationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffD32026),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 5),
        ],
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Michael Solomon",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Donation ID:",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: Colors.white,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Units",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: Colors.white,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lives Saved",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.white,
            indent: 50,
            endIndent: 50,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: Colors.white,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Gallons",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: Colors.white,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Blood Type",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 50),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: QrImage(
              backgroundColor: Colors.white,
              data: "Hello",
              size: 200,
              version: QrVersions.auto,
            ),
          )
        ],
      ),
    );
  }
}
