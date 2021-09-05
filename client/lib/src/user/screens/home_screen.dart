import 'package:eshiblood/src/user/bloc/bottom_navigation_bloc.dart';
import 'package:eshiblood/src/user/bloc/bottom_navigation_event.dart';
import 'package:eshiblood/src/user/bloc/bottom_navigation_state.dart';
import 'package:eshiblood/src/user/screens/donation_card_screen.dart';
import 'package:eshiblood/src/user/screens/donation_history_screen.dart';
import 'package:eshiblood/src/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'dart:math' as math;

import 'package:sliver_tools/sliver_tools.dart';

class HomeScreen extends StatelessWidget {
  CategoryBrain category = CategoryBrain();

  ScrollController controller = ScrollController();
  final tabs = [HomeWidget(), DonationCardScreen()];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtomNavigationBloc(),
      child: Scaffold(
          bottomNavigationBar: BottomNavigationWiget(),
          backgroundColor: Color(0xFFD32026),
          body: BlocBuilder<ButtomNavigationBloc, BottomNavigationState>(
            builder: (context, state) {
              return LayoutBuilder(
                builder: (context, c) {
                  return tabs[state.currentIndex];
                },
              );
            },
          )),
    );
  }
}

class _MyAppSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
        final deltaExtent = settings!.maxExtent - settings.minExtent;
        final t =
            (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
                .clamp(0.0, 1.0) as double;
        final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
        final fadeEnd = 1.0;
        final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);
        return Stack(
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
                      Text('Michael Solomon',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.white,
                          )),
                      Row(
                        children: [
                          CircleAvatar(
                            child: Text('AB',
                                style: TextStyle(
                                  color: Color(0xFFD32026),
                                  fontWeight: FontWeight.bold,
                                )),
                            radius: 20,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(width: 6),
                          CircleAvatar(
                            child: Text('4',
                                style: TextStyle(
                                  color: Color(0xFFD32026),
                                  fontWeight: FontWeight.bold,
                                )),
                            radius: 20,
                            backgroundColor: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: opacity,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.vertical,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Text(
                                'AB',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFD32026),
                                    fontSize: 20.0),
                              ),
                            ),
                            Text(
                              'Blood Type',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 20,
                              color: Color(0xFFD32026),
                            )),
                        SizedBox(
                          width: 6,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.vertical,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Text(
                                '4',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFD32026),
                                    fontSize: 20.0),
                              ),
                            ),
                            Text(
                              'Lives Saved',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class Category {
  final String name;
  final Icon icon;
  final String? image;

  Category({required this.name, required this.icon, this.image});
}

class CategoryBrain {
  List<Category> category = [
    Category(
        name: 'Schedule Appointment',
        icon: Icon(Icons.calendar_today_rounded,
            size: 50.0, color: Color(0xFFD32026))),
    Category(
        name: 'Manage Appointment',
        icon: Icon(Icons.calendar_today_rounded,
            size: 50.0, color: Color(0xFFD32026))),
    Category(
        name: 'Donor Card',
        icon: Icon(Icons.request_page_outlined,
            size: 50.0, color: Color(0xFFD32026))),
    Category(
        name: 'Donation History',
        icon:
            Icon(Icons.card_membership, size: 50.0, color: Color(0xFFD32026))),
    Category(
        name: 'Profile',
        icon: Icon(Icons.card_giftcard_outlined,
            size: 50.0, color: Color(0xFFD32026))),
    Category(
        name: 'Eligibility Notice',
        icon: Icon(Icons.history_edu_outlined,
            size: 50.0, color: Color(0xFFD32026))),
    Category(
        name: 'Take a selfie',
        icon: Icon(Icons.camera_alt_outlined,
            size: 50.0, color: Color(0xFFD32026))),
    Category(
        name: 'Settings',
        icon: Icon(Icons.settings, size: 50.0, color: Color(0xFFD32026))),
  ];
}

class BottomNavigationWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state.currentIndex,
          onTap: (int value) {
            context.read<ButtomNavigationBloc>().add(
                  ClickBottomNavigationEvent(currentIndex: value),
                );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xFFD32026),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.request_quote),
              label: 'Request List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.api_outlined),
              label: 'Appointment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}

class HomeWidget extends StatelessWidget {
  CategoryBrain category = CategoryBrain();

  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          controller: controller,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xFFD32026),
              expandedHeight: 150.0,
              floating: true,
              leading: Container(),
              snap: true,
              elevation: 50.0,
              pinned: true,
              flexibleSpace: _MyAppSpace(),
            ),
            SliverStack(
              insetOnOverlap: false,
              children: [
                SliverPositioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    top: 40,
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                  ),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 30.0,
                      crossAxisSpacing: 24.0,
                      childAspectRatio: 1.15,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Material(
                          color: Colors.white,
                          elevation: 14,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15.0),
                          child: InkWell(
                            // TODO: Onclick
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.pushNamed(context,
                                      RouteGenerator.appointmentUpsert);
                                  break;
                                case 1:
                                  Navigator.pushNamed(context,
                                      RouteGenerator.appointmentDetail);
                                  break;

                                case 2:
                                  Navigator.pushNamed(
                                      context, RouteGenerator.donorCardScreen);

                                  // Navigator.pushNamed(context,
                                  //     RouteGenerator.appointmentUpsert);
                                  break;

                                case 3:
                                  Navigator.pushNamed(context,
                                      RouteGenerator.appointmentUpsert);
                                  break;

                                case 4:
                                  Navigator.pushNamed(context,
                                      RouteGenerator.appointmentUpsert);
                                  break;

                                case 5:
                                  Navigator.pushNamed(context,
                                      RouteGenerator.appointmentUpsert);
                                  break;

                                case 6:
                                  Navigator.pushNamed(context,
                                      RouteGenerator.appointmentUpsert);
                                  break;

                                case 7:
                                  Navigator.pushNamed(context,
                                      RouteGenerator.appointmentUpsert);
                                  break;
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 1),
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    category.category[index].icon,
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      category.category[index].name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFD32026),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: category.category.length,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
