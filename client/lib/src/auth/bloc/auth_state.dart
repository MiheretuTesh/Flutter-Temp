abstract class AuthState {}

class LoginInProgress extends AuthState {}

class LoggedIn extends AuthState {}

class LoggedOut extends AuthState {}

class AuthFailed extends AuthState {
  final String errorMsg;

  AuthFailed({required this.errorMsg});
}
