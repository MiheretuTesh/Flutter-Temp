import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UserSignIn extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final dynamic image;
  final String dateOfBirth;
  final String? lastDonation;
  final String bloodType;
  final String gender;
  final dynamic role;

  UserSignIn(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
      required this.image,
      required this.dateOfBirth,
      this.lastDonation = '',
      required this.bloodType,
      this.role,
      required this.gender});

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        phoneNumber,
        email,
        image,
        dateOfBirth,
        lastDonation,
        bloodType,
        role,
        gender
      ];

  @override
  factory UserSignIn.fromJson(Map<String, dynamic> json) {
    return UserSignIn(
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        image: json['image'],
        dateOfBirth: json['dateOfBirth'],
        bloodType: json['bloodType']['bloodTypeName'],
        role: json['roles'],
        gender: json['gender']);
  }

  @override
  String toString() =>
      'UserSignIn.toString()\n  {firstName: $firstName, lastName:$lastName, phoneNumber:$phoneNumber, email:$email, image:$image, dateOfBirth: $dateOfBirth,';
}
