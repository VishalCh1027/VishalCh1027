import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/purchases/service.dart';
import 'package:my_application/bloc/purchases/state.dart';
import 'package:my_application/models/purchaserequest_model.dart';

class PurchasesCubit extends Cubit<PurchasesState> {
  final PurchasesService repository;
  PurchasesCubit({required this.repository})
      : super(const PurchasesState.loading());

  Future<void> getWorkmens(int projectId) async {
    var rs = await repository.getPurchases(projectId);
    if (rs != null) {
      emit(PurchasesState.success(rs));
    } else {
      emit(PurchasesState.failure());
    }
  }

  Future<void> updatelist(PurchaseRequest Purchases) async {
    state.Purchases[state.Purchases.indexOf(Purchases)] = Purchases;
    if (state.Purchases != null) {
      emit(PurchasesState.success(state.Purchases));
    } else {
      emit(PurchasesState.failure());
    }
  }
}
