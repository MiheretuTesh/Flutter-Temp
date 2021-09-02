import 'dart:io';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  LoginEvent({required this.phoneNumber, required this.password});
}

class SignupEvent extends AuthEvent {
  final dynamic profile;
  SignupEvent({required this.profile});
}
