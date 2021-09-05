import 'package:eshiblood/src/auth/models/user_model.dart';

abstract class AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String? phoneNumber;
  final dynamic role;
  final String? token;
  final String? id;

  LoggedIn({this.phoneNumber, this.role, this.token, this.id});
}

class LoggedOut extends AuthenticationEvent {}

class WelcomeScreenCompleted extends AuthenticationEvent {}
