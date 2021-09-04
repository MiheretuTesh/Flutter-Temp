import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static SecureStorage? _instance;

  factory SecureStorage() =>
      _instance ??= SecureStorage._(FlutterSecureStorage());

  SecureStorage._(this._storage);

  final FlutterSecureStorage _storage;
  static const _tokenKey = 'TOKEN';
  static const _phoneNumberKey = 'PHONENUMBER';
  static const _role = 'ROLE';

  Future<void> persistPhoneRoleAndToken(
      String phoneNumber, String role, String token) async {
    // print('ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ');
    // await deleteToken();
    // print(await hasToken());
    await _storage.write(key: _phoneNumberKey, value: phoneNumber);
    await _storage.write(key: _role, value: role);
    await _storage.write(key: _tokenKey, value: token);
    // print(await hasToken());
    // print(await getRole());
    // print('YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY');
  }

  Future<bool> hasToken() async {
    var value = await _storage.read(key: _tokenKey);
    return value != null;
  }

  Future<bool> hasPhoneNumber() async {
    var value = await _storage.read(key: _phoneNumberKey);
    return value != null;
  }

  Future<bool> hasRole() async {
    var value = await _storage.read(key: _role);
    return value != null;
  }

  Future<void> deleteToken() async {
    return _storage.delete(key: _tokenKey);
  }

  Future<void> deletePhoneNumber() async {
    return _storage.delete(key: _phoneNumberKey);
  }

  Future<void> deleteRole() async {
    return _storage.delete(key: _role);
  }

  Future<String?> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  Future<String?> getPhoneNumber() async {
    return _storage.read(key: _phoneNumberKey);
  }

  Future<String?> getRole() async {
    return _storage.read(key: _role);
  }

  Future<void> deleteAll() async {
    return _storage.deleteAll();
  }

  @override
  String toString() {
    // TODO: implement toString
    return _tokenKey;
  }
}
