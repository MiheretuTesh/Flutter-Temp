import 'package:eshiblood/src/appointment/models/appointment.dart';
import 'package:eshiblood/src/auth/widgets/round_button.dart';
import 'package:eshiblood/src/user/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppointmentCurrent extends StatelessWidget {
  static const routeName = 'appointmentDetail';
  // final Appointment appointment;

  // AppointmentCurrent({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(
                              "assets/images/welcome_background_image.png",
                              height: 220),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 222,
                          height: 220,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "First name",
                                style: TextStyle(fontSize: 32),
                              ),
                              Text(
                                "DOB",
                                style:
                                    TextStyle(fontSize: 19, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Weight"),
                                          Icon(Icons.accessibility_new),
                                          Text("data"),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text("Status "),
                                          Icon(
                                            Icons.circle,
                                            color: Colors.greenAccent,
                                          ),
                                          Text("Active")
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      "Appointment Description",
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Dr. Stefeni Albert is a cardiologist in Nashville & affiliated with multiple hospitals in the  area.He received his medical degree from Duke University School of Medicine and has been in practice for more than 20 years. ",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Donation Center Address",
                                        style: TextStyle(
                                            color:
                                                Colors.black87.withOpacity(0.7),
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              268,
                                          child: Text(
                                            "Woreda, city state , Status: Open\nEthiopia",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.timelapse,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Duration",
                                        style: TextStyle(
                                            color:
                                                Colors.black87.withOpacity(0.7),
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                268,
                                            height: 50,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30),
                                                ),
                                                color: Colors.blueAccent),
                                            child: Center(
                                              child: Text(
                                                '''20/10/2020''',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                            child: Center(
                                              child: Text(" - "),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                268,
                                            height: 50,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30),
                                                ),
                                                color: Colors.redAccent),
                                            child: Center(
                                              child: Text(
                                                '''20/10/2020''',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Activity",
                      style: TextStyle(
                          color: Color(0xff242424),
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 24, horizontal: 16),
                            decoration: BoxDecoration(
                                color: Color(0xffFBB97C),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color(0xffFCCA9B),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Icon(Icons.list)),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      130,
                                  child: Text(
                                    "List",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 24, horizontal: 16),
                            decoration: BoxDecoration(
                                color: Color(0xffA5A5A5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color(0xffBBBBBB),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Icon(Icons.list)),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      130,
                                  child: Text(
                                    "Doctor",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //   Positioned(
            //     bottom: 5,
            //     left: 0,
            //     right: 0,
            //     height: 50,
            //     child: Center(
            //       child: Container(
            //         width: 100,
            //         height: 50,
            //         color: Colors.redAccent[300],
            //         child: RoundButton(
            //           color: Colors.redAccent[300],
            //           text: "Cancel",
            //           width: 100,
            //           height: 40,
            //         ),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({required this.imgAssetPath, required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
