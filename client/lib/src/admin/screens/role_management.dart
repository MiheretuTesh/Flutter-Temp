import 'package:eshiblood/src/appointment/screens/create_donation_center.dart';
import 'package:flutter/material.dart';

class RoleManagementScaffold extends StatelessWidget {
  const RoleManagementScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("role"),
      ),
      body: RoleManagement(),
    );
  }
}

class RoleManagement extends StatelessWidget {
  const RoleManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                // RoleProfileWidget(),
                // CurrentPrivilleges(),
                PrivillegeWidget()
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PrivillegeWidget extends StatelessWidget {
  const PrivillegeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: Colors.black12,
                offset: Offset(1, 1),
                spreadRadius: 2)
          ]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(
                height: 1.2,
                fontSize: 20,
              ),
              cursorColor: Color(0xFFD32026),
              decoration: InputDecoration(
                hintText: "Role Name",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                labelText: "Role",
                labelStyle: TextStyle(color: Colors.redAccent, fontSize: 14),
                contentPadding: EdgeInsets.only(left: 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD32026), width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD32026), width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          HorizontalDivider(
            height: 1,
            label: "Privilleges:  ",
          ),
          SizedBox(
            height: 20,
          ),
          PrivillegeWidgetIn(
            label: "Appointment",
            canCreate: true,
          ),
          paddedHorizontalLine(),
          PrivillegeWidgetIn(
            label: "Request",
            canCreate: true,
          ),
          paddedHorizontalLine(),
          PrivillegeWidgetIn(
            label: "Role",
            canCreate: true,
          ),
          paddedHorizontalLine(),
          PrivillegeWidgetIn(
            label: "User",
            canUpdate: true,
          ),
          paddedHorizontalLine(),
          PrivillegeWidgetIn(
            label: "Donation Center",
            canCreate: true,
          ),
          paddedHorizontalLine(),
          UpdateRoleButton(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class CurrentPrivilleges extends StatelessWidget {
  const CurrentPrivilleges({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      // height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: Colors.black12,
                offset: Offset(1, 1),
                spreadRadius: 2)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Row(
          //   children: [Text("Privilleges:  ")],
          // ),
          SizedBox(
            height: 20,
          ),
          HorizontalDivider(
            height: 1,
            label: "Current Privilleges:  ",
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrivillegeWidgetOut(
                label: "Appointment: ",
                canCreate: true,
                canUpdate: true,
                canDelete: true,
                canRead: true,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 1,
            color: Color(0xffd32026),
            indent: 40,
            endIndent: 40,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrivillegeWidgetOut(
                label: "Request: ",
                canCreate: false,
                canUpdate: true,
                canDelete: false,
                canRead: true,
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          Divider(
            height: 1,
            color: Color(0xffd32026),
            indent: 40,
            endIndent: 40,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrivillegeWidgetOut(
                label: "Role: ",
                canCreate: true,
                canUpdate: true,
                canDelete: false,
                canRead: true,
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          Divider(
            height: 2,
            color: Color(0xffd32026),
            indent: 40,
            endIndent: 40,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrivillegeWidgetOut(
                label: "User: ",
                canCreate: true,
                canUpdate: true,
                canDelete: true,
                canRead: true,
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          Divider(
            height: 2,
            color: Color(0xffd32026),
            indent: 40,
            endIndent: 40,
          ),

          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrivillegeWidgetOut(
                label: "Donation Center: ",
                canCreate: true,
                canUpdate: true,
                canDelete: false,
                canRead: true,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class RoleProfileWidget extends StatelessWidget {
  const RoleProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: EdgeInsets.only(bottom: 10),
      // height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: Colors.black12,
                offset: Offset(1, 1),
                spreadRadius: 2)
          ]),
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Colors.black12,
                        offset: Offset(1, 1),
                        spreadRadius: 2)
                  ]),
              child: Container(
                  child: Image.asset(
                "assets/images/person.png",
                fit: BoxFit.contain,
              )),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [Text("First Name: "), Text("Michael")],
                ),
                Row(
                  children: [Text("Last Name: "), Text("Solomon")],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [Text("Phone No: "), Text("+251966303009")],
                ),
                Row(
                  children: [Text("Blood Type: "), Text("A+")],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text("Email: "),
                    Text("se.michael.solomon@gmail.com")
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UpdateRoleButton extends StatelessWidget {
  const UpdateRoleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          print("clicked");
        },
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              "Update Role",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class paddedHorizontalLine extends StatelessWidget {
  const paddedHorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 1,
          color: Color(0xffd32026),
          indent: 40,
          endIndent: 40,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class PrivillegeWidgetIn extends StatefulWidget {
  bool canCreate = false;
  bool canRead = false;
  bool canUpdate = false;
  bool canDelete = false;
  String label;
  PrivillegeWidgetIn(
      {this.canCreate = false,
      this.canRead = false,
      this.canUpdate = false,
      this.canDelete = false,
      required this.label});

  @override
  _PrivillegeWidgetInState createState() => _PrivillegeWidgetInState(
        canCreate: this.canCreate,
        canDelete: this.canDelete,
        canUpdate: this.canUpdate,
        canRead: this.canRead,
        label: this.label,
      );
}

class _PrivillegeWidgetInState extends State<PrivillegeWidgetIn> {
  bool canCreate = false;
  bool canRead = false;
  bool canUpdate = false;
  bool canDelete = false;
  String label;
  _PrivillegeWidgetInState(
      {this.canCreate = false,
      this.canRead = false,
      this.canUpdate = false,
      this.canDelete = false,
      required this.label});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(this.label),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 200,
                  // height: 100,
                  child: GridView.count(
                    childAspectRatio: 4,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    children: [
                      select(label: "CREATE", storeValue: this.canCreate),
                      select(label: "READ", storeValue: this.canRead),
                      select(label: "UPDATE", storeValue: this.canUpdate),
                      select(label: "DELETE", storeValue: this.canDelete),
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget select({required String label, required bool storeValue}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(label),
        Checkbox(
            value: storeValue,
            onChanged: (bool? value) {
              setState(() {
                storeValue = !storeValue;
              });
              print(this.toJson());
            })
      ],
    );
  }

  Map<String, Map<String, bool>> toJson() {
    return {
      this.label: {
        "create": this.canCreate,
        "update": this.canUpdate,
        "read": this.canRead,
        "delete": this.canDelete
      }
    };
  }
}

class PrivillegeWidgetOut extends StatelessWidget {
  bool canCreate = false;
  bool canRead = false;
  bool canUpdate = false;
  bool canDelete = false;
  String label;
  PrivillegeWidgetOut(
      {this.canCreate = false,
      this.canRead = false,
      this.canUpdate = false,
      this.canDelete = false,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(this.label),
        Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 200,
                  // height: 100,
                  child: GridView.count(
                    childAspectRatio: 4,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    children: [
                      action(label: "CREATE", checkLogic: this.canCreate),
                      action(label: "READ", checkLogic: this.canRead),
                      action(label: "UPDATE", checkLogic: this.canUpdate),
                      action(label: "DELETE", checkLogic: this.canDelete),
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget action({required String label, required bool checkLogic}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(label),
        Container(
          margin: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
              color: checkLogic ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(5)),
          width: 10,
          height: 10,
        )
      ],
    );
  }
}
