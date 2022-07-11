import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/Wallet/service.dart';
import 'package:my_application/bloc/Wallet/state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletService repository;
  WalletCubit({required this.repository}) : super(const WalletState.loading());

  Future<void> getTransactions(int employeeId) async {
    var rs = await repository.getTransactions(employeeId);
    if (rs != null) {
      emit(WalletState.success(rs));
    } else {
      emit(WalletState.failure());
    }
  }
}
