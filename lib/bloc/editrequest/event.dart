import 'package:equatable/equatable.dart';
import 'package:my_application/models/purchaserequest_model.dart';

class RequestEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetRequest extends RequestEvent {
  final PurchaseRequest request;

  GetRequest(this.request);
}

class EditRequest extends RequestEvent {
  final PurchaseRequest Requests;

  EditRequest(this.Requests);
}
