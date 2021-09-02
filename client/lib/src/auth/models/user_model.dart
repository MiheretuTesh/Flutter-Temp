import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String image;
  final String dateOfBirth;
  final String lastDonation;
  final String password;

  User(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
      required this.image,
      required this.dateOfBirth,
      required this.lastDonation,
      required this.password});

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        phoneNumber,
        email,
        image,
        dateOfBirth,
        lastDonation,
        password
      ];

  @override
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        image: json['image'],
        dateOfBirth: json['dateOfBirth'],
        lastDonation: json['lastDonation'],
        password: json['password']);
  }

  @override
  String toString() => 'User {name: $firstName}';
}
