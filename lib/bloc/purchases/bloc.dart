import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/purchases/service.dart';
import 'package:my_application/bloc/purchases/state.dart';
import 'package:my_application/models/purchaserequest_model.dart';

class PurchasesCubit extends Cubit<PurchasesState> {
  final PurchasesService repository;
  PurchasesCubit({required this.repository})
      : super(const PurchasesState.loading());

  Future<void> getPurchases(int employeeId, String status) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PurchasesStatus.PurchasesLoading) {
        var rs = await repository.getPurchases(
            employeeId, status, state.purchases.length);
        emit(PurchasesState.intial(rs, false));
      }
      var rs = await repository.getPurchases(
          employeeId, status, state.purchases.length);
      rs.isEmpty
          ? emit(PurchasesState.success(state.purchases, true))
          : emit(PurchasesState.success(
              List.of(state.purchases)..addAll(rs), false));
    } catch (e) {
      emit(PurchasesState.failure());
    } catch (e) {
      return;
    }
  }

  Future<void> getTechnicalHeadRequests(int employeeId, String status) async {
    if (state.hasReachedMax) return;
    try {
      var rs = await repository.getTechnicalHeadRequests(
          employeeId, status, state.purchases.length);
      if (state.status == PurchasesStatus.PurchasesLoading) {
        emit(PurchasesState.intial(rs, false));
      } else {
        rs.isEmpty
            ? emit(PurchasesState.success(state.purchases, true))
            : emit(PurchasesState.success(
                List.of(state.purchases)..addAll(rs), false));
      }
    } catch (e) {
      emit(PurchasesState.failure());
    }
  }

  void PageChange() {
    emit(PurchasesState.loading());
  }

  Future<void> editPurchase(PurchaseRequest request) async {
    var newstate = state.copyWith();
    newstate.purchases.forEach((element) {
      element.selected = false;
    });
    newstate.purchases[newstate.purchases.indexOf(request)].selected = true;
    if (newstate.purchases.isNotEmpty) {
      emit(PurchasesState.editing(newstate.purchases));
    } else {
      emit(PurchasesState.failure());
    }
  }

  Future<void> deletePurchase(request) async {
    var newstate = state.copyWith();
    newstate.purchases.remove(request);
    if (newstate.purchases.isNotEmpty) {
      emit(PurchasesState.editing(newstate.purchases));
    } else {
      emit(PurchasesState.listIsEmty());
    }
  }

  Future<void> unSelectAll() async {
    var newstate = state.copyWith();
    newstate.purchases.forEach((element) {
      element.selected = false;
    });
    if (newstate.purchases.isNotEmpty) {
      emit(PurchasesState.success(newstate.purchases, state.hasReachedMax));
    } else {
      emit(PurchasesState.failure());
    }
  }
}
