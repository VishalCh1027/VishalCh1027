import 'package:equatable/equatable.dart';
import 'package:my_application/models/purchaserequest_model.dart';

import '../../models/loginmodel.dart';

enum PurchasesStatus {
  PurchasesLoading,
  PurchasesLoadedSuccessfully,
  PurchasesError
}

class PurchasesState extends Equatable {
  const PurchasesState._({
    this.status = PurchasesStatus.PurchasesLoading,
    this.Purchases = const <PurchaseRequest>[],
  });
  final PurchasesStatus status;
  final List<PurchaseRequest> Purchases;

  const PurchasesState.loading() : this._();

  const PurchasesState.success(List<PurchaseRequest> Purchases)
      : this._(
            status: PurchasesStatus.PurchasesLoadedSuccessfully,
            Purchases: Purchases);

  const PurchasesState.failure()
      : this._(status: PurchasesStatus.PurchasesError);

  PurchasesState copyWith({
    List<PurchaseRequest>? Purchases,
  }) {
    return PurchasesState._(
      Purchases: Purchases ?? this.Purchases,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, Purchases];
}
