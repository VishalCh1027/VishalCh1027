import 'package:my_application/models/orderItem_model.dart';

class PurchaseRequest {
  int? id;

  String? orderNO;

  DateTime? deliveryAt;

  double? amount;

  int? employeeId;

  int? projectId;

  String? status;

  String? reason;

  List<OrderItem>? orderItems;

  PurchaseRequest({
    this.id,
    this.orderNO,
    this.amount,
    this.deliveryAt,
    this.status,
    this.orderItems,
    this.reason,
    this.employeeId,
    this.projectId,
  });

  PurchaseRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    deliveryAt = json['deliveryAt'];
    status = json['status'];
    orderItems = json['orderItems'];
    reason = json['reason'];
    employeeId = json['employeeId'];
    projectId = json['projectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> prurchaseRequest = <String, dynamic>{};
    prurchaseRequest['id'] = id;
    prurchaseRequest['amount'] = amount;
    prurchaseRequest['status'] = status;
    prurchaseRequest['orderItems'] = orderItems;
    prurchaseRequest['reason'] = reason;
    prurchaseRequest['employeeId'] = employeeId;
    prurchaseRequest['projectId'] = projectId;
    return prurchaseRequest;
  }
}
