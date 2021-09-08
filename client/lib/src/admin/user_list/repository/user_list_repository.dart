import 'package:eshiblood/src/admin/user_list/data_provider/user_list_provider.dart';
import 'package:eshiblood/src/auth/models/user_model.dart';

class UserListRepository {
  final UserListProvider userListProvider;

  UserListRepository({required this.userListProvider});

  Future<List<User>> getUserList() async {
    print('--------------------> Repository UserList');
    return await userListProvider.getUserList();
  }
}
