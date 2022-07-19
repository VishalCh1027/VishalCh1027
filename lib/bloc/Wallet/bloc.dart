import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/Wallet/service.dart';
import 'package:my_application/bloc/Wallet/state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletService repository;
  WalletCubit({required this.repository}) : super(const WalletState.loading());

  Future<void> getTransactions(int employeeId) async {
    await Future.delayed(Duration(seconds: 5));
    if (state.hasReachedMax) return;
    try {
      var rs = await repository.getTransactions(
          employeeId, state.transactions.length);
      if (state.status == TransactionStatus.TransactionLoading) {
        emit(WalletState.initial(
            List.of(state.transactions)..addAll(rs), false));
      } else {
        rs.isEmpty
            ? emit(WalletState.success(state.transactions, true))
            : emit(WalletState.success(
                List.of(state.transactions)..addAll(rs), false));
      }
    } catch (e) {
      emit(WalletState.failure());
    } catch (e) {
      return;
    }
  }
}
