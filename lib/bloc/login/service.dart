import 'package:my_application/global/global_variables.dart';
import 'package:my_application/models/business_model.dart';
import 'package:my_application/models/employee_model.dart';
import 'package:my_application/models/loginmodel.dart';
import '../../helpers/local_helper.dart';

class LoginService {
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
    try {
      var account = LoginModel(
          email: "vishal@gmail.com",
          password: "1234567",
          employee: Employee(
              id: 1,
              firstName: "Vishal",
              lastName: "chinta",
              mobile: "8355952505",
              email: "vishal@gmail.com",
              business: Business(
                  email: "demobusiness@gmail.com",
                  id: 1,
                  name: "Demo Business")));
      //var rs = await HttpHelper.post(Uri.parse(LOGIN_ENDPOINT), accountInput);

      var result = username == account.email && password == account.password;
      if (result) {
        // var jsonObject = jsonDecode(rs.body);
        // var account = LoginModel.fromJson(jsonObject);
        currentLogin = account;
        LocalHelper.saveAccountToLocal(account);

        return account;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future logOut() async {
    currentLogin = LoginModel();
    return await LocalHelper.deleteAccountFromLocal();
  }
}
