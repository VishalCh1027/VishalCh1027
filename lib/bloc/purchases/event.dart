import 'package:equatable/equatable.dart';
import 'package:my_application/models/purchaserequest_model.dart';

class PurchasesEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetPurchases extends PurchasesEvent {
  final int employeeId;

  GetPurchases(this.employeeId);
  @override
  // TODO: implement props
  List<Object> get props => [employeeId];
}
