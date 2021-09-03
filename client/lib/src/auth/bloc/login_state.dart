import 'package:eshiblood/src/auth/bloc/form_submission_status.dart';

class LoginState {
  final String phoneNumber;
  bool get isPhoneNumberValid => phoneNumber.startsWith('09');
  final String password;
  bool get isPasswordValid => password.length >= 4;
  final FormSubmissionStatus formStatus;

  LoginState({
    required this.phoneNumber,
    required this.password,
    FormSubmissionStatus this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? phoneNumber,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
