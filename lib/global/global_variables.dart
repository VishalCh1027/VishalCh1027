import 'package:my_application/helpers/local_helper.dart';
import 'package:my_application/models/claim_model.dart';
import 'package:my_application/models/loginmodel.dart';
import 'package:my_application/models/office_model.dart';

LoginModel currentLogin = LoginModel();
List<Claim> claims = [];
Office currentOffice = Office();

getGlobal() async {
  var login = await LocalHelper.getAccountFromLocal();

  var office = await LocalHelper.getOfficeFromLocal();
  currentLogin = login;
}
