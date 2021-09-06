import 'package:eshiblood/src/admin/screens/role_management.dart';
import 'package:eshiblood/src/admin/user_list/screens/users_screen.dart';
import 'package:eshiblood/src/appointment/screens/create_donation_center.dart';
import 'package:eshiblood/src/auth/bloc/auth_bloc.dart';
import 'package:eshiblood/src/auth/bloc/auth_event.dart';
import 'package:eshiblood/src/auth/bloc/login_bloc.dart';
import 'package:eshiblood/src/auth/bloc/login_event.dart';
import 'package:eshiblood/src/auth/bloc/login_state.dart';
import 'package:eshiblood/src/request/screen/create_request.dart';
import 'package:eshiblood/src/request/screen/request_detail.dart';
import 'package:eshiblood/src/user/screens/profile_screen.dart';
import 'package:eshiblood/src/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

final _baseUrl = '192.168.1.13:8000';

class DashboardScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color(0xffd32026),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                padding: EdgeInsets.all(15.0),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Today\'s Appointments',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 44,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFD32026))),
                              TextSpan(
                                  text: 'People',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 200.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pointBrain.points.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _pointTile(context, index);
                    },
                  )),
              DefaultTabController(
                length: 2,
                child: Container(
                  height: 500,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        indicatorColor: Color(0xFFD32026),
                        tabs: <Widget>[
                          Tab(
                              child: Text('Reward Wallet',
                                  style: TextStyle(color: Color(0xFFD32026)))),
                          Tab(
                              child: Text('Redeem',
                                  style: TextStyle(color: Color(0xFFD32026)))),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10.0),
                                child: ListView.builder(
                                  itemCount: rewardBrain.rewards.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _rewardTile(context, index);
                                  },
                                )),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10.0),
                                child: ListView.builder(
                                  itemCount: rewardBrain.redeems.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _redeemTile(context, index);
                                  },
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _redeemTile(context, index) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${rewardBrain.redeems[index].giftName}',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text('${rewardBrain.redeems[index].description}',
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                    SizedBox(height: 6),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xFFD32026),
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: LinearPercentIndicator(
                          width: 100.0,
                          lineHeight: 8.0,
                          percent: 0.5,
                          progressColor: Color(0xFFD32026),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
        Divider(
          height: 2,
          color: Colors.grey[200],
        )
      ],
    );
  }

  Widget _rewardTile(context, index) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${rewardBrain.rewards[index].giftName}',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text('${rewardBrain.rewards[index].description}',
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                    SizedBox(height: 6),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFFD32026),
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text('Claim reward')),
                    )
                  ],
                ),
                // TODO: Wrap with inkwell
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      child: Icon(
                        Icons.chevron_right,
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      child: Icon(
                        Icons.wrong_location_rounded,
                      ),
                    ),
                  ],
                ),
              ],
            )),
        Divider(
          height: 2,
          color: Colors.grey[200],
        )
      ],
    );
  }

  Widget _pointTile(context, index) {
    return Container(
        margin: EdgeInsets.all(10.0),
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEEEEEE),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(2, 5),
            )
          ],
          border: Border.all(
            width: 0.5,
            color: Color(0xFFEEEEEE),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${pointBrain.points[index].title}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      )),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xFFD32026),
                          width: 0.8,
                        )),
                    width: 40.0,
                    height: 40.0,
                    child: Center(
                      child: Text('${pointBrain.points[index].point}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          )),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Spacer(),
                  Text('${pointBrain.points[index].dueDate}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}

class PointBrain {
  List<PointModel> points = [
    PointModel(
      title: 'Invitation',
      dueDate: 'Permanent',
      point: '+2',
    ),
    PointModel(
      title: 'Invitation',
      dueDate: 'Permanent',
      point: '+2',
    ),
    PointModel(
      title: 'Invitation',
      dueDate: 'Permanent',
      point: '+2',
    ),
    PointModel(
      title: 'Invitation',
      dueDate: 'Permanent',
      point: '+2',
    ),
  ];
}

PointBrain pointBrain = PointBrain();

class PointModel {
  String title;
  String point;
  Image? backgroundImage;
  String dueDate;

  PointModel(
      {required this.title,
      required this.point,
      this.backgroundImage,
      required this.dueDate});
}

class RewardBrain {
  List<RewardModel> rewards = [
    RewardModel(
      giftName: '1GB internet package',
      description: 'Earn a total of 500 points',
    ),
    RewardModel(
      giftName: '1GB internet package',
      description: 'Earn a total of 500 points',
    ),
    RewardModel(
      giftName: '1GB internet package',
      description: 'Earn a total of 500 points',
    ),
    RewardModel(
      giftName: '1GB internet package',
      description: 'Earn a total of 500 points',
    ),
    RewardModel(
      giftName: '1GB internet package',
      description: 'Earn a total of 500 points',
    ),
    RewardModel(
      giftName: '1GB internet package',
      description: 'Earn a total of 500 points',
    ),
  ];

  List<RewardModel> redeems = [
    RewardModel(
      giftName: '10% off ahoon stoodio',
      description: 'Earn a total of 250 points',
    ),
    RewardModel(
      giftName: '50% off Eshi Digital Marketing',
      description: 'Earn a total of 200 points',
    ),
    RewardModel(
      giftName: '1GB internet package',
      description: 'Earn a total of 500 points',
    ),
    RewardModel(
      giftName: '1GB internet package',
      description: 'Earn a total of 500 points',
    ),
    RewardModel(
      giftName: '1GB internet package',
      description: 'Earn a total of 500 points',
    ),
    RewardModel(
      giftName: '1GB internet package',
      description: 'Earn a total of 500 points',
    ),
  ];
}

RewardBrain rewardBrain = RewardBrain();

class RewardModel {
  String description;
  String giftName;
  // CircularPercentIndicator indicator;

  RewardModel({
    required this.description,
    required this.giftName,
  });
}

class NavigationDrawerWidget extends StatelessWidget {
  final Padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, stateLogin) {
        return Drawer(
          child: Material(
            color: Color(0xFFD32026),
            child: ListView(
              padding: Padding,
              children: [
                buildHeader(
                  image: "http:///images/users/${stateLogin.user?.image}",
                  name:
                      "${stateLogin.user?.firstName} ${stateLogin.user?.lastName}",
                  phoneNumber: "${stateLogin.user?.phoneNumber}",
                  onClicked: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                buildMenuItem(
                  text: 'Dashboard',
                  icon: Icons.desktop_mac,
                  onClicked: () => selectedItem(context, 0),
                ),
                Divider(
                  color: Colors.white70,
                  height: 4,
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Users list',
                  icon: Icons.people,
                  onClicked: () => selectedItem(context, 1),
                ),
                Divider(
                  color: Colors.white70,
                  height: 4,
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Create Donation Center',
                  icon: Icons.add_business_outlined,
                  onClicked: () => selectedItem(context, 2),
                ),
                const SizedBox(height: 16),
                Divider(
                  color: Colors.white70,
                  height: 4,
                ),
                buildMenuItem(
                  text: 'Create Request',
                  icon: Icons.article_outlined,
                  onClicked: () => selectedItem(context, 3),
                ),
                const SizedBox(height: 24),
                Divider(
                  color: Colors.white70,
                  height: 4,
                ),
                const SizedBox(height: 24),
                buildMenuItem(
                    text: 'Request Detail',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 4)),
                Divider(
                  color: Colors.white70,
                  height: 4,
                ),
                const SizedBox(height: 24),
                buildMenuItem(
                    text: 'Role Management',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 5)),
                Divider(
                  color: Colors.white70,
                  height: 4,
                ),
                const SizedBox(height: 24),
                buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () {
                      print('Logout Clicked From Dashboard Screen');
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(LoggedOut());
                      BlocProvider.of<LoginBloc>(context).add(LoginLoggedOut());
                      Navigator.of(context)
                          .popAndPushNamed(RouteGenerator.loginScreen);
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget buildHeader({
    required String image,
    required String name,
    required String phoneNumber,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 31,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      radius: 30, backgroundImage: NetworkImage(image))),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    phoneNumber,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              // Spacer(),
              // CircleAvatar(
              //   radius: 24,
              //   backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              //   child: Icon(Icons.add_comment_outlined, color: Colors.white),
              // )
            ],
          ),
        ),
      );

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UsersScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateDonationCenterScaffold()));
        break;
      case 3:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateRequestScaffold()));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RequestDetail()));
        break;
      case 5:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => RoleManagementScaffold()));
        break;
    }
  }
}
