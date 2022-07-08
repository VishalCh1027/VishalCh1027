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
      emit(BillingState.success(rs));
    } else {
      emit(BillingState.failure());
    }
  }

  Future<void> getProcurementApprovals(int employeeId, String status) async {
    var rs = await repository.getProcurementApprovals(employeeId, status);
    if (rs != null) {
      emit(BillingState.success(rs));
    } else {
      emit(BillingState.failure());
    }
  }
}
