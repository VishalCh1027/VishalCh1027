import 'package:equatable/equatable.dart';
import 'package:my_application/models/purchaserequest_model.dart';

class PurchasesState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PurchasesLoadedSuccessfully extends PurchasesState {
  final List<PurchaseRequest> requests;

  PurchasesLoadedSuccessfully(this.requests);
  @override
  // TODO: implement props
  List<Object> get props => [requests];
}

class PurchasesLoading extends PurchasesState {}

class PurchasesError extends PurchasesState {}

class PurchasesSavedSuccessfully extends PurchasesState {
  final Object result;

  PurchasesSavedSuccessfully(this.result);
  @override
  // TODO: implement props
  List<Object> get props => [result];
}
