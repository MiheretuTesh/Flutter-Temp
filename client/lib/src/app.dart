import 'package:eshiblood/src/screens/donation_card_screen.dart';
import 'package:eshiblood/src/screens/welcome_screen.dart';
import './screens/registration_screen.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScaffold(),
    );
  }
}
