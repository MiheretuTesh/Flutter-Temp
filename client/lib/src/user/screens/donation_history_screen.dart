import 'package:eshiblood/src/auth/widgets/round_button.dart';
import 'package:flutter/material.dart';

class DonationHistoryScreen extends StatelessWidget {
  final VoidCallback? onFlip;

  const DonationHistoryScreen({Key? key, this.onFlip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Donation History",
                    style: TextStyle(
                      color: Color(0xFFD32026),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFFD32026),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Text(
                                '6',
                                style: TextStyle(
                                  color: Color(0xFFD32026),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text('Donation'),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFFD32026),
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Text(
                            '3 weeks to donate',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('08 Sep, 2020'),
                                subtitle: Text('Ezi bota'),
                                trailing: Text('8:42'),
                              ),
                              Divider(
                                color: Color(0xFFD32026),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RoundButton(
                      color: Color(0xFFD32026),
                      text: 'Schedule an Appointment',
                      textColor: Colors.white,
                      onPressed: () {},
                      borderCurve: 10.0,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Tooltip(
                message: "Swipe to see donation history",
                child: IconButton(
                  onPressed: () => onFlip,
                  icon: Icon(
                    Icons.switch_right,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
