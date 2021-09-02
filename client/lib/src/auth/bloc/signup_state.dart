import 'package:eshiblood/src/auth/bloc/form_submission_status.dart';

class SignUpState {
  final String firstName;

  final String email;

  final String password;

  final dynamic profile;

  final FormSubmissionStatus formStatus;

  SignUpState({
    this.firstName = '',
    this.email = '',
    this.password = '',
    this.profile = null,
    this.formStatus = const InitialFormStatus(),
  });

  SignUpState copyWith({
    String? firstName,
    String? email,
    String? password,
    dynamic profile,
    FormSubmissionStatus? formStatus,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
      password: password ?? this.password,
      profile: profile ?? this.profile,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
