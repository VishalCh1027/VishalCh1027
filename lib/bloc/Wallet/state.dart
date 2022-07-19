import 'package:my_application/models/wallettransactions_model.dart';

enum TransactionStatus {
  TransactionLoading,
  TransactionInitial,
  TransactionLoadedSuccessfully,
  TransactionEditing,
  listIsEmty,
  TransactionError
}

class WalletState {
  const WalletState._({
    this.status = TransactionStatus.TransactionLoading,
    this.transactions = const <WalletTransaction>[],
    this.hasReachedMax = false,
  });
  final TransactionStatus status;
  final List<WalletTransaction> transactions;
  final bool hasReachedMax;

  const WalletState.loading() : this._();

  const WalletState.initial(
      List<WalletTransaction> transactions, bool hasReachedMax)
      : this._(
            status: TransactionStatus.TransactionInitial,
            transactions: transactions,
            hasReachedMax: hasReachedMax);

  const WalletState.success(
      List<WalletTransaction> transactions, bool hasReachedMax)
      : this._(
            status: TransactionStatus.TransactionLoadedSuccessfully,
            hasReachedMax: hasReachedMax,
            transactions: transactions);

  const WalletState.listIsEmty() : this._(status: TransactionStatus.listIsEmty);

  const WalletState.failure()
      : this._(status: TransactionStatus.TransactionError);

  WalletState copyWith({
    List<WalletTransaction>? transactions,
  }) {
    return WalletState._(
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, transactions];
}
