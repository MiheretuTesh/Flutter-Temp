import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final dynamic image;
  final String dateOfBirth;
  final String? lastDonation;
  final String password;
  final String bloodType;
  // final String gender;
  final dynamic role;

  User(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
      required this.image,
      required this.dateOfBirth,
      this.lastDonation,
      required this.password,
      required this.bloodType,
      required this.role,
      // required this.gender
      });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        phoneNumber,
        email,
        image,
        dateOfBirth,
        lastDonation,
        password,
        bloodType,
        role,
        // gender
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
        password: json['password'],
        bloodType: json['bloodType']['bloodTypeName'],
        role: json['roles'],
        // gender: json['gender']
        );
  }

  @override
  String toString() => 'User\n  {firstName: $firstName, gender: , image: $image}';
}
