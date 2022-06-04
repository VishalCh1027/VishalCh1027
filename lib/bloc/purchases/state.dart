import 'package:equatable/equatable.dart';
import 'package:my_application/models/purchaserequest_model.dart';

import '../../models/loginmodel.dart';

enum PurchasesStatus {
  PurchasesLoading,
  PurchasesLoadedSuccessfully,
  PurchasesEditing,
  listIsEmty,
  PurchasesError
}

class PurchasesState {
  const PurchasesState._({
    this.status = PurchasesStatus.PurchasesLoading,
    this.purchases = const <PurchaseRequest>[],
  });
  final PurchasesStatus status;
  final List<PurchaseRequest> purchases;

  const PurchasesState.loading() : this._();

  const PurchasesState.success(List<PurchaseRequest> Purchases)
      : this._(
            status: PurchasesStatus.PurchasesLoadedSuccessfully,
            purchases: Purchases);

  const PurchasesState.editing(List<PurchaseRequest> Purchases)
      : this._(status: PurchasesStatus.PurchasesEditing, purchases: Purchases);

  const PurchasesState.listIsEmty()
      : this._(status: PurchasesStatus.listIsEmty);

  const PurchasesState.failure()
      : this._(status: PurchasesStatus.PurchasesError);

  PurchasesState copyWith({
    List<PurchaseRequest>? Purchases,
  }) {
    return PurchasesState._(
      purchases: Purchases ?? this.purchases,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, purchases];
}
