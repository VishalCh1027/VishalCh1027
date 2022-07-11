import 'package:my_application/models/wallettransactions_model.dart';

enum TransactionStatus {
  TransactionLoading,
  TransactionLoadedSuccessfully,
  TransactionEditing,
  listIsEmty,
  TransactionError
}

class WalletState {
  const WalletState._({
    this.status = TransactionStatus.TransactionLoading,
    this.transactions = const <WalletTransaction>[],
  });
  final TransactionStatus status;
  final List<WalletTransaction> transactions;

  const WalletState.loading() : this._();

  const WalletState.success(List<WalletTransaction> transactions)
      : this._(
            status: TransactionStatus.TransactionLoadedSuccessfully,
            transactions: transactions);

  const WalletState.editing(List<WalletTransaction> transactions)
      : this._(
            status: TransactionStatus.TransactionEditing,
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
