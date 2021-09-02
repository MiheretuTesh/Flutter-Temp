abstract class SignUpEvent {}

class SignUpFirstNameChanged extends SignUpEvent {
  final String firstName;

  SignUpFirstNameChanged({required this.firstName});
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;

  SignUpEmailChanged({required this.email});
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;

  SignUpPasswordChanged({required this.password});
}

class SignUpProfileChanged extends SignUpEvent {
  final dynamic profile;

  SignUpProfileChanged({required this.profile});
}

class SignUpSubmitted extends SignUpEvent {}
