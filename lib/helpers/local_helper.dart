import 'dart:convert';

import 'package:my_application/helpers/securestorage.dart';
import 'package:my_application/models/loginmodel.dart';
import 'package:my_application/models/office_model.dart';

class LocalHelper {
  static saveAccountToLocal(LoginModel accountModel) async {
    final SecureStorage store = await SecureStorage();
    var str = json.encode(accountModel);
    var rs = await store.writeSecureData('login', str);
  }

  static deleteAccountFromLocal() async {
    final SecureStorage store = await SecureStorage();
    var rs = await store.deleteSecureData('login');
  }

  static Future<LoginModel> getAccountFromLocal() async {
    try {
      final SecureStorage store = await SecureStorage();
      var account = await store.readSecureData('login');
      if (account != null) {
        return LoginModel.fromJson(json.decode(account));
      }
      return LoginModel();
    } catch (e) {
      return LoginModel();
    }
  }

  static Future<Office> getOfficeFromLocal() async {
    final SecureStorage store = await SecureStorage();
    var office = await store.readSecureData('office');
    if (office != null) {
      return Office.fromJson(json.decode(office as String));
    }
    return Office();
  }
}
