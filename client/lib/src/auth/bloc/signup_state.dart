import 'package:eshiblood/src/auth/bloc/form_submission_status.dart';

class SignUpState {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String dateOfBirth;
  final String gender;
  final String bloodType;
  final dynamic profile;
  final FormSubmissionStatus formStatus;
  final dynamic role;

  SignUpState({
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.email = '',
    this.password = '',
    this.dateOfBirth = '',
    this.gender = 'male',
    this.bloodType = 'A+',
    this.profile = null,
    this.role = 'user',
    this.formStatus = const InitialFormStatus(),
  });

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? password,
    String? dateOfBirth,
    String? gender,
    String? bloodType,
    dynamic profile,
    FormSubmissionStatus? formStatus,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      bloodType: bloodType ?? this.bloodType,
      profile: profile ?? this.profile,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
