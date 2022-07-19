import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/billings/service.dart';
import 'package:my_application/bloc/billings/state.dart';

class BillingCubit extends Cubit<BillingState> {
  final BillingService repository;
  BillingCubit({required this.repository})
      : super(const BillingState.loading());

  Future<void> getBilling(int employeeId, String status) async {
    var rs = await repository.getBilling(employeeId, status);
    if (rs != null) {
      emit(BillingState.success(rs, false));
    } else {
      emit(BillingState.failure());
    }
  }

  Future<void> getProcurementApprovals(int employeeId, String status) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == BillingStatus.BillingLoading) {
        var rs = await repository.getProcurementApprovals(employeeId, status);
        emit(BillingState.initial(rs, false));
      }
      var rs = await repository.getProcurementApprovals(
          employeeId, status, state.billing.length);
      rs.isEmpty
          ? emit(BillingState.success(state.billing, true))
          : emit(
              BillingState.success(List.of(state.billing)..addAll(rs), false));
    } catch (e) {
      emit(BillingState.failure());
    }
  }

  void PageChange() {
    emit(BillingState.loading());
  }
}
