import 'package:eshiblood/src/auth/bloc/auth_event.dart';
import 'package:eshiblood/src/auth/bloc/auth_state.dart';
import 'package:eshiblood/src/auth/repository/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SecureStorage userRepository;

  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(event) async* {
    if (event is LoggedIn) {
      yield* _loggedIn(event);
    } else if (event is LoggedOut) {
      yield* _loggedOut(event);
    }
  }

  Stream<AuthenticationState> _initStartup() async* {
    final hasToken = await userRepository.hasToken();
    // print("AAAAAAAAAAAAAAAAAAAAA $hasToken");

    if (!hasToken) {
      // print("BBBBBBBBBBBBBBBBBBBB $hasToken");
      yield AuthenticationUnauthenticated();
      return;
    }

    // print("CCCCCCCCCCCCCCCCCCC $hasToken");
    yield AuthenticationAuthenticated();
  }

  Stream<AuthenticationState> _loggedIn(LoggedIn event) async* {
    // print(
    //     "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
    yield AuthenticationLoading();
    // print(event.role);
    await userRepository.persistPhoneRoleAndToken(
        event.phoneNumber!, event.role, event.token!);

    yield* _initStartup();
  }

  Stream<AuthenticationState> _loggedOut(LoggedOut event) async* {
    yield AuthenticationLoggingOut();
    await userRepository.deleteToken();
  }
}
