import 'package:flutter/material.dart';
import "package:percent_indicator/circular_percent_indicator.dart";
import 'dart:math' as math;

class RequestDetail extends StatelessWidget {
  static const String id = 'event_dashboard_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color(0xFFD32026),
          expandedHeight: 200.0,
          title: Text(''),
          floating: true,
          leading: Container(),
          flexibleSpace: _MyAppSpace(),
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    color: Colors.white,
                    child: Column(
                      children: [
                        
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Units Needed',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      '13',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        Divider(thickness: 1.0, color: Colors.grey[300]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 50),
                                  child: Text(
                                    'Reason',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ]),
                        ),
                        // Divider(thickness: 1.0, color: Color(0xFFD32026)),
                        Divider(thickness: 1.0, color: Colors.grey[300]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Blood Type',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'A+',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Divider(thickness: 1.0, color: Colors.grey[300]),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Total Donation',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '7',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Status',
                                  style: TextStyle(fontSize: 20),

                                ),
                                Text(
                                  'Active',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Created By',
                                  style: TextStyle(fontSize: 20),

                                ),
                                Text(
                                  'You',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        
                        
                        SizedBox(
                          height: 30.0,
                        ),
                        RoundButton(
                          onPressed: () {},
                          text: Text(
                            'Make Appointment',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Color(0xFFD32026),
                          borderCurve: 5,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: 1,
        ))
      ]),
    ));
  }
}

class _MyAppSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
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
                    Text('Event name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white,
                        )),
                    CircularPercentIndicator(
                      backgroundColor: Color(0xFFD32026),
                      radius: 40.0,
                      lineWidth: 4.0,
                      // TODO percent state
                      percent: 0.5,
                      center: Text('50%',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      progressColor: Colors.white,
                    ),
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
                            CircularPercentIndicator(
                              backgroundColor: Color(0xFFD32026),
                              radius: 80.0,
                              lineWidth: 8.0,
                              percent: 0.5,
                              center: Text('50%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              progressColor: Colors.white,
                            ),
                            Text(
                              'Event Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      );
    });
  }
}

class RoundButton extends StatelessWidget {
  Color color;
  Text text;
  Function onPressed;
  double padding;
  double borderCurve;
  double width;
  RoundButton(
      {required this.color,
      required this.text,
      required this.onPressed,
      this.padding = 12.0,
      this.borderCurve = 30.0,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Material(
        shadowColor: Color(0xFFD32026),
        elevation: 10.0,
        color: color,
        borderRadius: BorderRadius.circular(borderCurve),
        child: MaterialButton(
          onPressed: () => {onPressed()},
          minWidth: width,
          height: 55.0,
          child: this.text,
        ),
      ),
    );
  }
}
