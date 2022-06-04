import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/purchases/service.dart';
import 'package:my_application/bloc/purchases/state.dart';
import 'package:my_application/models/purchaserequest_model.dart';

class PurchasesCubit extends Cubit<PurchasesState> {
  final PurchasesService repository;
  PurchasesCubit({required this.repository})
      : super(const PurchasesState.loading());

  Future<void> getPurchases(int projectId) async {
    var rs = await repository.getPurchases(projectId);
    if (rs != null) {
      emit(PurchasesState.success(rs));
    } else {
      emit(PurchasesState.failure());
    }
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
      emit(PurchasesState.editing(newstate.purchases));
    } else {
      emit(PurchasesState.failure());
    }
  }
}
