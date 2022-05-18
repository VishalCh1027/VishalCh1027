import 'dart:convert';

import 'package:my_application/global/global_variables.dart';
import 'package:my_application/models/loginmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/http_helper.dart';
import '../../helpers/local_helper.dart';
import '../bloc_service.dart';

class LoginService extends BlocService<LoginModel> {
  @override
  Future<LoginModel> get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<LoginModel>> getAll({int from = 0, int? limit}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  Future<LoginModel> getCurrentLogin() async {
    var rs = await LocalHelper.getAccountFromLocal();
    currentLogin = rs;
    return currentLogin;
  }

  Future<LoginModel?> logIn(String username, String password) async {
    Map<String, String> accountInput = {
      "username": username,
      "password": password
    };
    var rs = await HttpHelper.post(Uri.parse(LOGIN_ENDPOINT), accountInput);
    print(rs.statusCode);
    if (rs.statusCode == 200) {
      var jsonObject = jsonDecode(rs.body);
      var account = LoginModel.fromJson(jsonObject);
      currentLogin = account;
      LocalHelper.saveAccountToLocal(account);

      return account;
    }
    return null;
  }

  Future logOut() async {
    currentLogin = LoginModel();
    return await LocalHelper.deleteAccountFromLocal();
  }
}
