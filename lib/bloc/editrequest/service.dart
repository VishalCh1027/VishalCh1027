import 'package:my_application/bloc/bloc_service.dart';
import 'package:my_application/models/purchaserequest_model.dart';

class RequestService extends BlocService<PurchaseRequest> {
  Future<PurchaseRequest> getRequest(PurchaseRequest request) async {
    return request;
  }
}
