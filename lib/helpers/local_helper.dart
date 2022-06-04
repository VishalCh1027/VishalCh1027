import 'dart:convert';

import 'package:my_application/helpers/securestorage.dart';

import '../models/loginmodel.dart';

class LocalHelper {
  static saveAccountToLocal(LoginModel accountModel) async {
    final SecureStorage store = await SecureStorage();
    var rs = await store.writeSecureData('login', json.encode(accountModel));
  }

  static deleteAccountFromLocal() async {
    final SecureStorage store = await SecureStorage();
    var rs = await store.deleteSecureData('login');
  }

  static Future<LoginModel> getAccountFromLocal() async {
    final SecureStorage store = await SecureStorage();
    var account = store.readSecureData('login');
    if (account != null) {
      return LoginModel.fromJson(json.decode(account as String));
    }
    return LoginModel();
  }
}
