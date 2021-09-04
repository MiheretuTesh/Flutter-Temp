import 'package:eshiblood/src/auth/bloc/auth_bloc.dart';
import 'package:eshiblood/src/auth/bloc/auth_event.dart';
import 'package:eshiblood/src/auth/bloc/form_submission_status.dart';
import 'package:eshiblood/src/auth/bloc/login_event.dart';
import 'package:eshiblood/src/auth/models/user_model.dart';
import 'package:eshiblood/src/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eshiblood/src/auth/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.authRepository, required this.authenticationBloc})
      : super(LoginState(phoneNumber: "0", password: "0"));

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPhoneNumberChanged) {
      yield state.copyWith(phoneNumber: event.phoneNumber);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());
      try {
        final userCredential = await authRepository.login(
            state.phoneNumber, state.password) as Map<String, dynamic>;
        User newUser = userCredential["user"] as User;

        // TODO: Shared preference case
        authenticationBloc.add(LoggedIn(
            phoneNumber: state.phoneNumber,
            role: newUser.role[0]["roleName"],
            token: userCredential["token"]));

        yield state.copyWith(formStatus: SubmissionSuccess());
        // auth cubit
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed("errorMessage"));
      }
    }
  }
}
