import 'package:eshiblood/src/auth/bloc/auth_event.dart';
import 'package:eshiblood/src/auth/bloc/auth_state.dart';
import 'package:eshiblood/src/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(LoggedOut());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      final phoneNumber = event.phoneNumber;
      final password = event.password;

      yield LoginInProgress();
      await Future.delayed(Duration(seconds: 2));

      var response = await authRepository.login(phoneNumber, password);
      if (response != null) {
        print(response);

        yield LoggedIn();
      } else {
        print('jjoui');
        yield AuthFailed(errorMsg: "Account does not exist");
        await Future.delayed(Duration(seconds: 2));
        yield LoggedOut();
      }
    }

    if (event is SignupEvent) {
      final profile = event.profile;
      yield LoginInProgress();
      await Future.delayed(Duration(seconds: 2));

      var response = await authRepository.signup(profile);
      if (response != null) {
        print(response);

        yield LoggedIn();
      } else {
        print("jjouii");
        yield AuthFailed(errorMsg: "Account does not exist");
        await Future.delayed(Duration(seconds: 2));
        yield LoggedOut();
      }
    }
  }
}
