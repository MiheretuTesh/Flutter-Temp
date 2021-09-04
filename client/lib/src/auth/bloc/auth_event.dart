abstract class AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String? phoneNumber;
  final dynamic role;
  final String? token;

  LoggedIn({this.phoneNumber, this.role, this.token});
}

class LoggedOut extends AuthenticationEvent {}

class WelcomeScreenCompleted extends AuthenticationEvent {}
