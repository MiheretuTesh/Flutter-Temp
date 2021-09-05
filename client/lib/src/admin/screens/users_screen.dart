import 'package:eshiblood/src/admin/screens/dashboard_screen.dart';
import 'package:eshiblood/src/auth/widgets/horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'package:overlay_dialog/overlay_dialog.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      drawer: NavigationDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return DonorCard(context);
          },
        ),
      ),
    );
  }

  Widget DonorCard(context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            DialogHelper().show(
              context,
              DialogWidget.custom(
                style: DialogStyle.adaptive,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 300,
                  margin: EdgeInsets.all(20),
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.amberAccent,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Michael Solomon',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFFD32026),
                            ),
                          ),
                        ),
                        HorizontalDivider(
                          label: "Role",
                        ),
                        CheckboxListTile(
                          title: Text("User"),
                          secondary: Icon(Icons.verified_user),
                          controlAffinity: ListTileControlAffinity.platform,
                          value: true,
                          onChanged: (bool? value) {
                            // the state here
                          },
                          activeColor: Colors.green,
                          checkColor: Colors.black,
                        ),
                        // Use bloc state for the value
                        CheckboxListTile(
                          title: Text("Admin"),
                          secondary: Icon(Icons.admin_panel_settings_rounded),
                          controlAffinity: ListTileControlAffinity.platform,
                          value: false,
                          onChanged: (bool? value) {
                            // the state here
                          },
                          activeColor: Colors.green,
                          checkColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.45,
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(40),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFFD32026),
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.person,
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.redAccent,
            child: Text('4'),
          ),
        ),
      ],
    );
  }
}
