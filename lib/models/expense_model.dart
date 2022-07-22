import 'package:my_application/models/employee_model.dart';

class ProjectExpense {
  int? id;

  double? amount;

  String? type;

  String? referenceNumber;

  String? invoiceNumber;

  int? projectId;

  int? employeeId;

  int? vendorId;

  Employee? employee;

  ProjectExpense({
    this.amount,
    this.id,
    this.type,
    this.referenceNumber,
    this.projectId,
  });

  ProjectExpense.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    amount = json['amount'] == null ? 0.0 : json['amount'].toDouble();
    employeeId = json['employeeId'];
    vendorId = json['vendorId'];
    invoiceNumber = json['invoiceNumber'];
    type = json['type'];
    referenceNumber = json['referenceNumber'];
    projectId = json['projectId'];
    employee =
        json['employee'] != null ? Employee.fromJson(json['employee']) : null;
  }
}
