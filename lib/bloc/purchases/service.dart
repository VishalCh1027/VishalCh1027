import 'dart:convert';
import 'package:my_application/global/global_variables.dart';
import '../../helpers/http_helper.dart';
import '../../models/purchaserequest_model.dart';
import '../bloc_service.dart';

class PurchasesService extends BlocService<PurchaseRequest> {
  Future<List<PurchaseRequest>?> GetPurchases(int employeeId) async {
    var rs = await HttpHelper.get(Uri.parse(PURCHASE_REQUEST_ENDPOINT),
        bearerToken: currentLogin.token);
    print(rs.statusCode);
    if (rs.statusCode == 200) {
      var jsonObject = jsonDecode(rs.body);
      var requests = List<PurchaseRequest>.from(
          [jsonObject].map((e) => PurchaseRequest.fromJson(e)));

      return requests;
    }
    return null;
  }
}
