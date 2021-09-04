import 'package:eshiblood/src/auth/screens/dashboard_screen.dart';
import 'package:eshiblood/src/auth/screens/eligibility_screen.dart';
import 'package:eshiblood/src/auth/screens/home_screen.dart';
import 'package:eshiblood/src/auth/screens/login_screen.dart';
import 'package:eshiblood/src/auth/screens/registration_screen.dart';
import 'package:eshiblood/src/auth/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String welcomeScreen = "/";
  static const String loginScreen = "/login";
  static const String registrationScreen = "/registration";
  static const String eligibilityNoticeScreen = "/eligibilityNotice";
  static const String homeScreen = "/home";
  static const String dashboardScreen = "/dashboard";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registrationScreen:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case eligibilityNoticeScreen:
        return MaterialPageRoute(builder: (_) => EligibilityNoticeScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case dashboardScreen:
        return MaterialPageRoute(builder: (_) => DashboardScreen());

      default:
        throw FormatException("Route was not found");
    }
  }
}
