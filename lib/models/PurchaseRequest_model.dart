import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_application/models/orderItem_model.dart';
import 'package:my_application/common/priority_enum.dart';
import 'package:my_application/models/project_model.dart';

class PurchaseRequest {
  int? id;

  String? orderNo;

  DateTime? deliveryAt;

  double? amount;

  int? employeeId;

  int? projectId;

  int? status;

  String? reason;

  List<OrderItem> orderItems = [];

  Project? project;

  String? priority;

  bool selected = false;

  PurchaseRequest(
      {this.id,
      this.orderNo,
      this.amount,
      this.deliveryAt,
      this.status,
      this.reason,
      this.employeeId,
      this.projectId,
      this.project,
      this.priority})
      : orderItems = [];

  PurchaseRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    deliveryAt = DateTime.parse(json['deliveryAt']);
    status = json['orderStatus'];
    orderNo = json['orderNo'];
    orderItems = List<OrderItem>.from(
        (json['orderItems'].map((e) => OrderItem.fromJson(e))));
    reason = json['reason'];
    employeeId = json['employeeId'];
    projectId = json['projectId'];
    project = Project.fromJson(json['project']);
    priority = RequestPriority.values[json['priority']]
        .toString()
        .replaceFirst(RegExp("RequestPriority."), "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> prurchaseRequest = <String, dynamic>{};
    prurchaseRequest['id'] = id;
    prurchaseRequest['amount'] = amount;
    prurchaseRequest['status'] = status;
    prurchaseRequest['orderItems'] = jsonEncode(orderItems);
    prurchaseRequest['reason'] = reason;
    prurchaseRequest['employeeId'] = employeeId;
    prurchaseRequest['projectId'] = projectId;
    prurchaseRequest['project'] = jsonEncode(project);
    return prurchaseRequest;
  }
}
