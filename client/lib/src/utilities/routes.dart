import 'package:eshiblood/src/admin/screens/dashboard_screen.dart';
import 'package:eshiblood/src/admin/screens/role_management.dart';
import 'package:eshiblood/src/admin/screens/users_screen.dart';
import 'package:eshiblood/src/appointment/screens/appointment_add.dart';
import 'package:eshiblood/src/appointment/screens/appointment_current.dart';
import 'package:eshiblood/src/appointment/screens/create_donation_center.dart';
import 'package:eshiblood/src/auth/screens/eligibility_screen.dart';
import 'package:eshiblood/src/auth/screens/login_screen.dart';
import 'package:eshiblood/src/auth/screens/registration_screen.dart';
import 'package:eshiblood/src/auth/screens/welcome_screen.dart';
import 'package:eshiblood/src/request/screen/create_request.dart';
import 'package:eshiblood/src/request/screen/request_detail.dart';
import 'package:eshiblood/src/user/screens/donation_card_screen.dart';
import 'package:eshiblood/src/user/screens/donation_history_screen.dart';
import 'package:eshiblood/src/user/screens/home_screen.dart';
import 'package:eshiblood/src/user/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String welcomeScreen = "/";
  static const String loginScreen = "/login";
  static const String registrationScreen = "/registration";
  static const String eligibilityNoticeScreen = "/eligibilityNotice";
  static const String homeScreen = "/homeScreen";
  static const String dashboardScreen = "/dashboardScreen";
  static const String userListScreen = "/userListScreen";
  static const String donationHistoryScreen = "/donationHistoryScreen";
  static const String donorCardScreen = "/donorCardScreen";
  static const String profileScreen = "/profileScreen";
  static const String appointmentUpsert = "/appointmentUpsert";
  static const String appointmentDetail = "/appointmentDetail";
  static const String donationCenterCreate = "/donationCenterCreate";
  static const String requestCreate = "/requestCreate";
  static const String requestDetail = "/requestDetail";
  static const String roleManagement = "/roleManagement";

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
      case userListScreen:
        return MaterialPageRoute(builder: (_) => UsersScreen());
      case donationHistoryScreen:
        return MaterialPageRoute(builder: (_) => DonationHistoryScreen());
      case donorCardScreen:
        return MaterialPageRoute(builder: (_) => DonationCardScreen());
      case profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case appointmentUpsert:
        return MaterialPageRoute(builder: (_) => AppointmentCreate());
      case appointmentDetail:
        return MaterialPageRoute(builder: (_) => AppointmentCurrent());
      case donationCenterCreate:
        return MaterialPageRoute(
            builder: (_) => CreateDonationCenterScaffold());
      case requestCreate:
        return MaterialPageRoute(builder: (_) => CreateRequestScaffold());
      case requestDetail:
        return MaterialPageRoute(builder: (_) => RequestDetail());
      case roleManagement:
        return MaterialPageRoute(builder: (_) => RoleManagementScaffold());
      default:
        throw FormatException("Route was not found");
    }
  }
}
