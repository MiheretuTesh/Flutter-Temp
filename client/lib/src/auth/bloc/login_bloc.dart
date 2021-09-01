import 'package:eshiblood/src/auth/bloc/form_submission_status.dart';
import 'package:eshiblood/src/auth/bloc/login_event.dart';
import 'package:eshiblood/src/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:eshiblood/src/auth/bloc/auth_event.dart';
import 'package:eshiblood/src/auth/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository})
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
        final userId =
            await authRepository.login(state.phoneNumber, state.password);
        yield state.copyWith(formStatus: SubmissionSuccess());
        // auth cubit
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed("errorMessage"));
      }
    }
  }
}
