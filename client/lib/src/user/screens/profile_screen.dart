import 'package:eshiblood/src/auth/bloc/auth_bloc.dart';
import 'package:eshiblood/src/auth/bloc/auth_state.dart';
import 'package:eshiblood/src/auth/bloc/login_bloc.dart';
import 'package:eshiblood/src/auth/bloc/login_state.dart';
import 'package:eshiblood/src/auth/bloc/signup_bloc.dart';
import 'package:eshiblood/src/auth/bloc/signup_state.dart';
import 'package:eshiblood/src/auth/widgets/horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';

final _baseUrl = '192.168.1.13:8000';

class ProfileScreen extends StatelessWidget {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            controller: controller,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Color(0xffd32026),
                expandedHeight: 300.0,
                floating: true,
                leading: Container(),
                snap: true,
                elevation: 50.0,
                pinned: true,
                flexibleSpace: _MyAppSpace(),
              ),
              SliverToBoxAdapter(
                child: _ProfileContentSpace(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileContentSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, authState) {
        return (authState is AuthenticationAuthenticated)
            ? Container(
                margin: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15, color: Colors.grey, spreadRadius: 2)
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HorizontalDivider(
                        label: 'Personal Information',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text("First name"),
                            trailing: Text("${authState.user?.firstName}"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                          ListTile(
                            leading: Text("Last name"),
                            trailing: Text("${authState.user?.lastName}"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                          ListTile(
                            leading: Text("Gender"),
                            trailing: Text("${authState.user?.gender}"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                          ListTile(
                            leading: Text("Date of Birth"),
                            trailing: Text("${authState.user?.dateOfBirth}"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                          ListTile(
                            leading: Text("Date of Birth"),
                            trailing: Text("EB-1001"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HorizontalDivider(
                        label: 'Credential Information',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text("Phone number"),
                            trailing: Text("${authState.user?.phoneNumber}"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                          ListTile(
                            leading: Text("Email"),
                            trailing: Text("${authState.user?.email}"),
                          ),
                          // Divider(
                          //   color: Colors.grey,
                          //   height: 1,
                          // ),
                          // ListTile(
                          //   leading: Text("User Id"),
                          //   trailing: Text("EB-1001"),
                          // ),
                          // Divider(
                          //   color: Colors.grey,
                          //   height: 1,
                          // ),
                          // ListTile(
                          //   leading: Text("User Id"),
                          //   trailing: Text("EB-1001"),
                          // ),
                          // Divider(
                          //   color: Colors.grey,
                          //   height: 1,
                          // ),
                          // ListTile(
                          //   leading: Text("User Id"),
                          //   trailing: Text("EB-1001"),
                          // ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HorizontalDivider(
                        label: 'Donation Information',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text("Blood Type"),
                            trailing: Text("${authState.user?.bloodType}"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                          ListTile(
                            leading: Text("Last Donation"),
                            trailing: Text("EB-1001"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                          ListTile(
                            leading: Text("User Id"),
                            trailing: Text("EB-1001"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                          ListTile(
                            leading: Text("User Id"),
                            trailing: Text("EB-1001"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                          ListTile(
                            leading: Text("User Id"),
                            trailing: Text("EB-1001"),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}

class _MyAppSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, authState) {
        return (authState is AuthenticationAuthenticated)
            ? LayoutBuilder(
                builder: (context, c) {
                  final settings = context.dependOnInheritedWidgetOfExactType<
                      FlexibleSpaceBarSettings>();
                  final deltaExtent = settings!.maxExtent - settings.minExtent;
                  final t = (1.0 -
                          (settings.currentExtent - settings.minExtent) /
                              deltaExtent)
                      .clamp(0.0, 1.0) as double;
                  final fadeStart =
                      math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
                  final fadeEnd = 1.0;
                  final opacity =
                      1.0 - Interval(fadeStart, fadeEnd).transform(t);
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Opacity(
                        opacity: 1 - opacity,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // TODO: Image
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 21,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'http://${_baseUrl}/images/users/${authState.user?.image}'),
                                        radius: 20,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "${authState.user?.firstName} ${authState.user?.lastName}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                CircleAvatar(
                                  radius: 21,
                                  backgroundColor: Color(0xffd32026),
                                  child: CircleAvatar(
                                    child: Text('${authState.user?.bloodType}',
                                        style: TextStyle(
                                          color: Color(0xFFD32026),
                                          fontWeight: FontWeight.bold,
                                        )),
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: opacity,
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.network(
                              'http://${_baseUrl}/images/users/${authState.user?.image}',
                              fit: BoxFit.cover,
                            )),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Opacity(
                          opacity: opacity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${authState.user?.firstName} ${authState.user?.lastName}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                'online',
                                style: TextStyle(
                                  color: Color(0xFFD32026),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        bottom: -30,
                        child: Opacity(
                          opacity: opacity,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 6,
                                      color: Colors.grey,
                                      spreadRadius: 2)
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Text(
                                  "${authState.user?.bloodType}",
                                  style: TextStyle(
                                    color: Color(0xFFD32026),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            : Container();
      },
    );
  }
}
