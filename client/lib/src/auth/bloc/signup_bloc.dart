import 'dart:io';

import 'package:eshiblood/src/auth/bloc/form_submission_status.dart';
import 'package:eshiblood/src/auth/bloc/signup_event.dart';
import 'package:eshiblood/src/auth/bloc/signup_state.dart';
import 'package:eshiblood/src/auth/models/user_model.dart';
import 'package:eshiblood/src/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;
  // final AuthCubit authCubit;

  SignUpBloc({required this.authRepo}) : super(SignUpState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    // Username updated
    if (event is SignUpFirstNameChanged) {
      yield state.copyWith(firstName: event.firstName);
      // Email updated
    } else if (event is SignUpLastNameChanged) {
      yield state.copyWith(lastName: event.lastName);
    } else if (event is SignUpPhoneNumberChanged) {
      yield state.copyWith(phoneNumber: event.phoneNumber);
    } else if (event is SignUpEmailChanged) {
      yield state.copyWith(email: event.email);
      // Password updated
    } else if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is SignUpDateOfBirthChanged) {
      yield state.copyWith(dateOfBirth: event.dateOfBirth);
    } else if (event is SignUpGenderChanged) {
      yield state.copyWith(gender: event.gender);
    } else if (event is SignUpBloodTypeChanged) {
      yield state.copyWith(bloodType: event.bloodType);
    }
    // Form submitted
    else if (event is SignUpProfileChanged) {
      yield state.copyWith(profile: event.profile);
    } else if (event is SignUpSubmitted) {
      User user = User(
          firstName: state.firstName,
          lastName: state.lastName,
          phoneNumber: state.phoneNumber,
          email: state.email,
          password: state.password,
          image: File(state.profile.path),
          dateOfBirth: state.dateOfBirth,
          // gender: state.gender,
          bloodType: state.bloodType,
          role: 'user');
      print(user);
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.signup(user);
        // username: state.username,
        // email: state.email,

        yield state.copyWith(formStatus: SubmissionSuccess());

        // authCubit.showConfirmSignUp(
        //   username: state.username,
        //   email: state.email,
        //   password: state.password,
        // );
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed('e'));
      }
    }
  }
}
