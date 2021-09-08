import 'package:eshiblood/src/appointment/models/appointment.dart';
import 'package:eshiblood/src/appointment/screen/appointment_add.dart';
import 'package:eshiblood/src/appointment/screen/appointment_argument.dart';
import 'package:eshiblood/src/appointment/screen/appointment_current.dart';
import 'package:eshiblood/src/appointment/screen/appointment_list.dart';
import 'package:eshiblood/src/auth/screens/eligibility_screen.dart';
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
      case AddAppointment.routeName:
        return MaterialPageRoute(
            builder: (_) =>
                AddAppointment(args: AppointmentArgument(edit: false)));
      case AppointmentList.routeName:
        return MaterialPageRoute(builder: (_) => AppointmentList());
      case AppointmentCurrent.routeName:
        Appointment appointment = settings.arguments as Appointment;
        return MaterialPageRoute(
            builder: (_) => AppointmentCurrent(appointment: appointment));
      default:
        throw FormatException("Route was not found");
    }
  }
}
