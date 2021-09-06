import 'package:eshiblood/src/admin/user_list/bloc/user_list_event.dart';
import 'package:eshiblood/src/admin/user_list/bloc/user_list_state.dart';
import 'package:eshiblood/src/admin/user_list/repository/user_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserListRepository userListRepository;

  UserListBloc({required this.userListRepository})
      : super(UserListStateInitial());

  @override
  Stream<UserListState> mapEventToState(UserListEvent event) async* {
    print(event.users);

    if (event is UserListEvent) {
      try {
        final dynamic users = await userListRepository.getUserList();
        print(users);
        if (users == null) {
          yield UserListStateLoading();
        } else {
          yield UserListStateLoaded(users: users);
        }
      } catch (e) {
        yield UserListStateError(error: e.toString());
      }
    }
  }
}
