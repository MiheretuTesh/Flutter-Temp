import 'package:eshiblood/src/admin/user_list/data_provider/user_list_provider.dart';

class UserListRepository {
  final UserListProvider userListProvider;

  UserListRepository({required this.userListProvider});

  Future<dynamic> getUserList() async {
    print('--------------------> Repository UserList');
    return await userListProvider.getUserList();
  }
}
