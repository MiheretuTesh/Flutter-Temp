import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/images/welcome_background_image.png'),
            fit: BoxFit.cover,
          )),
        )),
      ),
    );
  }
}
