import 'package:my_application/models/billing_model.dart';

enum BillingStatus {
  BillingLoading,
  Billinginitial,
  BillingLoadedSuccessfully,
  BillingEditing,
  listIsEmty,
  BillingError
}

class BillingState {
  const BillingState._({
    this.status = BillingStatus.BillingLoading,
    this.billing = const <Billing>[],
    this.hasReachedMax = false,
  });
  final BillingStatus status;
  final List<Billing> billing;
  final bool hasReachedMax;

  const BillingState.loading() : this._(status: BillingStatus.BillingLoading);

  const BillingState.initial(List<Billing> billing, bool hasReachedMax)
      : this._(
            status: BillingStatus.Billinginitial,
            billing: billing,
            hasReachedMax: hasReachedMax);

  const BillingState.success(List<Billing> billing, bool hasReachedMax)
      : this._(
            status: BillingStatus.BillingLoadedSuccessfully,
            billing: billing,
            hasReachedMax: hasReachedMax);

  const BillingState.listIsEmty() : this._(status: BillingStatus.listIsEmty);

  const BillingState.failure() : this._(status: BillingStatus.BillingError);

  BillingState copyWith({
    List<Billing>? billing,
  }) {
    return BillingState._(
      billing: billing ?? this.billing,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, billing, hasReachedMax];
}
