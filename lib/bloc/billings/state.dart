import 'package:my_application/models/billing_model.dart';

enum BillingStatus {
  BillingLoading,
  BillingLoadedSuccessfully,
  BillingEditing,
  listIsEmty,
  BillingError
}

class BillingState {
  const BillingState._({
    this.status = BillingStatus.BillingLoading,
    this.billing = const <Billing>[],
  });
  final BillingStatus status;
  final List<Billing> billing;

  const BillingState.loading() : this._();

  const BillingState.success(List<Billing> billing)
      : this._(
            status: BillingStatus.BillingLoadedSuccessfully, billing: billing);

  const BillingState.editing(List<Billing> billing)
      : this._(status: BillingStatus.BillingEditing, billing: billing);

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
  List<Object?> get props => [status, billing];
}
