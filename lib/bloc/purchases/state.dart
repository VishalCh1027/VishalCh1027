import 'package:my_application/models/purchaserequest_model.dart';

enum PurchasesStatus {
  PurchasesLoading,
  PurchaseInitial,
  PurchasesLoadedSuccessfully,
  PurchasesEditing,
  listIsEmty,
  PurchasesError
}

class PurchasesState {
  const PurchasesState._(
      {this.status = PurchasesStatus.PurchasesLoading,
      this.purchases = const <PurchaseRequest>[],
      this.hasReachedMax = false});
  final PurchasesStatus status;
  final List<PurchaseRequest> purchases;
  final bool hasReachedMax;
  const PurchasesState.loading() : this._();

  const PurchasesState.intial(
      List<PurchaseRequest> Purchases, bool hasReachedMax)
      : this._(
            status: PurchasesStatus.PurchaseInitial,
            purchases: Purchases,
            hasReachedMax: hasReachedMax);

  const PurchasesState.success(
      List<PurchaseRequest> Purchases, bool hasReachedMax)
      : this._(
            status: PurchasesStatus.PurchasesLoadedSuccessfully,
            purchases: Purchases,
            hasReachedMax: hasReachedMax);

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
