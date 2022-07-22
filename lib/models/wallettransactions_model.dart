import 'package:my_application/models/project_model.dart';
import 'package:my_application/models/workmen_model.dart';

class WalletTransaction {
  int? id;

  double? amount;

  String? description;

  int? walletId;

  DateTime? date;

  String? type;

  String? paymentType;

  String? referenceNumber;

  int? projectId;

  int? workmenId;

  int? walletEmployeeId;

  int? creditedEmployeeId;

  Project? project;

  Workmen? workmen;

  String? category;

  WalletTransaction(
      {this.amount,
      this.description,
      this.date,
      this.paymentType,
      this.type,
      this.referenceNumber,
      this.projectId,
      this.id,
      this.walletId,
      this.walletEmployeeId,
      this.workmenId,
      this.creditedEmployeeId,
      this.project,
      this.workmen});

  WalletTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    amount = json['amount'] == null ? 0.0 : json['amount'].toDouble();
    description = json['description'];
    date = DateTime.parse(json['date']);
    paymentType = json['paymentType'];
    type = json['type'];
    referenceNumber = json['referenceNumber'];
    projectId = json['projectId'];
    walletId = json['walletId'];
    walletEmployeeId = json['walletEmployeeId'];
    workmenId = json['workmenId'];
    creditedEmployeeId = json['creditedEmployeeId'];
    project =
        json['project'] != null ? Project.fromJson(json['project']) : null;
    workmen =
        json['workmen'] != null ? Workmen.fromJson(json['workmen']) : null;
  }

  WalletTransaction.empty() {
    id = null;
    amount = null;
    description = "";
    type = null;
    referenceNumber = "";
    projectId = null;
  }
}

enum PaymentType {
  Cash,

  OnlineTransfer,

  CreditCard,

  DebitCard,

  Cheque,

  NetBanking,

  UPI
}
