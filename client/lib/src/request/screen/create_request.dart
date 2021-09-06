import 'package:eshiblood/src/admin/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class CreateRequestScaffold extends StatelessWidget {
  const CreateRequestScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Request"),
        backgroundColor: Color(0xffd32026),
      ),
      drawer: NavigationDrawerWidget(),
      body: CreateRequest(),
    );
  }
}

class CreateRequest extends StatefulWidget {
  @override
  _CreateRequestState createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          AmountNeeded(),
          BloodTypeRadio(),
          ReasonWidget(),
          CreateRequestButton(),
        ],
      ),
    );
  }
}

class CreateRequestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(top: 20),
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xffd32026),
              border: Border.all(color: Color(0xffd32026)),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    color: Colors.black45, blurRadius: 10, offset: Offset(0, 0))
              ]),
          child: Center(
              child: Text(
            "Create Request",
            style: TextStyle(fontSize: 24, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

class ReasonWidget extends StatefulWidget {
  const ReasonWidget({Key? key}) : super(key: key);

  @override
  _ReasonWidgetState createState() => _ReasonWidgetState();
}

class _ReasonWidgetState extends State<ReasonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            Text("Reason"),
          ],
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffd32026)),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black45, blurRadius: 10, offset: Offset(0, 0))
              ]),
          child: TextField(
              maxLines: 10,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Reason for desktop",
                  contentPadding: EdgeInsets.all(10))),
        )
      ],
    );
  }
}

class AmountNeeded extends StatefulWidget {
  const AmountNeeded({Key? key}) : super(key: key);

  @override
  _AmountNeededState createState() => _AmountNeededState();
}

class _AmountNeededState extends State<AmountNeeded> {
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Amount Needed"),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.red),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black45, blurRadius: 10, offset: Offset(0, 0))
              ]),
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                  padding: EdgeInsets.only(bottom: 15, right: 25),
                  onPressed: () {
                    this.amount -= 1;
                    setState(() {});
                  },
                  icon: Icon(Icons.minimize)),
              Text(
                this.amount.toString(),
                style: TextStyle(fontSize: 24),
              ),
              IconButton(
                  padding: EdgeInsets.only(left: 25),
                  onPressed: () {
                    this.amount += 1;
                    setState(() {});
                  },
                  icon: Icon(Icons.add)),
            ],
          ),
        )
      ],
    );
  }
}

class BloodTypeRadio extends StatefulWidget {
  const BloodTypeRadio({Key? key}) : super(key: key);

  @override
  _BloodTypeRadioState createState() => _BloodTypeRadioState();
}

class _BloodTypeRadioState extends State<BloodTypeRadio> {
  String bloodType = "A+";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        width: 350,
        // height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            // border: Border.all(color: Colors.red),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black45, blurRadius: 10, offset: Offset(0, 0))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(width: 20,),
            Text("Blood Type"),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "A+";
                        setState(() {});
                      },
                      value: "A+",
                    ),
                    Text("A+")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "B+";
                        setState(() {});
                      },
                      value: "B+",
                    ),
                    Text("B+")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "AB+";
                        setState(() {});
                      },
                      value: "AB+",
                    ),
                    Text("AB+")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "O+";
                        setState(() {});
                      },
                      value: "O+",
                    ),
                    Text("O+")
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "A-";
                        setState(() {});
                      },
                      value: "A-",
                    ),
                    Text("A-")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "B-";
                        setState(() {});
                      },
                      value: "B-",
                    ),
                    Text("B-")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "AB-";
                        setState(() {});
                      },
                      value: "AB-",
                    ),
                    Text("AB-")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      groupValue: this.bloodType,
                      onChanged: (String? value) {
                        this.bloodType = "O-";
                        setState(() {});
                      },
                      value: "O-",
                    ),
                    Text("O-")
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
