import '../helpers/local_helper.dart';
import '../models/loginmodel.dart';

LoginModel currentLogin = new LoginModel();

getGlobal() async {
  var login = await LocalHelper.getAccountFromLocal();
  currentLogin = login;
}
