import 'package:my_application/models/claim_model.dart';
import 'package:my_application/models/office_model.dart';
import '../helpers/local_helper.dart';
import '../models/loginmodel.dart';

LoginModel currentLogin = new LoginModel();
List<Claim> claims = [];

Office currentOffice = new Office();

getGlobal() async {
  var login = await LocalHelper.getAccountFromLocal();

  var office = await LocalHelper.getOfficeFromLocal();
  currentLogin = login;
}
