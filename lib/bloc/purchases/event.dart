import 'package:equatable/equatable.dart';
import 'package:my_application/models/purchaserequest_model.dart';

class PurchasesEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetWorkmens extends PurchasesEvent {
  final int projectId;

  GetWorkmens(this.projectId);
}

class EditPurchases extends PurchasesEvent {
  final List<PurchaseRequest> Purchasess;

  EditPurchases(this.Purchasess);
}

class EditIntime extends PurchasesEvent {
  final PurchaseRequest Purchases;

  EditIntime(this.Purchases);
}
