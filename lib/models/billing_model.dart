import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:my_application/models/employee_model.dart';
import 'package:my_application/models/orderItem_model.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/models/vendor_model.dart';

class Billing {
  late int id;

  late double amount;

  late double? paymentMade;

  late int employeeId;

  late int projectId;

  late String status;

  late String reason;

  late int vendorId;

  late List<OrderItem>? orderItems;

  late Employee? employee;

  late Vendor? vendor;

  late Project? project;

  Billing({
    required this.id,
    required this.amount,
    this.paymentMade,
    required this.employeeId,
    required this.projectId,
  });

  Billing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    paymentMade = json['paymentMade'];
    status = json['orderStatus'];
    orderItems = List<OrderItem>.from(
        (json['orderItems'].map((e) => OrderItem.fromJson(e))));
    reason = json['reason'];
    employeeId = json['employeeId'];
    projectId = json['projectId'];
    project = Project.fromJson(json['project']);
    employee =
        json['employee'] != null ? Employee.fromJson(json['employee']) : null;
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> billing = <String, dynamic>{};
    billing['id'] = id;
    billing['amount'] = amount;
    billing['status'] = status;
    billing['orderItems'] = jsonEncode(orderItems);
    billing['reason'] = reason;
    billing['employeeId'] = employeeId;
    billing['projectId'] = projectId;
    billing['vendorId'] = vendorId;
    billing['project'] = jsonEncode(project);
    billing['employee'] = jsonEncode(employee);
    billing['vendor'] = jsonEncode(vendor);
    return billing;
  }
}
