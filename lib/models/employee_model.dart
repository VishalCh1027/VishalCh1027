import 'package:flutter/rendering.dart';
import 'package:my_application/models/employeepermissions.dart';

class Employee {
  final int? id;
  final String? usedId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobile;
  final String? dOB;
  final int? businessId;

  final List<EmployeePermissions>? permissions;

  Employee(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.dOB,
      this.businessId,
      this.usedId,
      this.permissions});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['id'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        mobile: json['mobile'],
        dOB: json['dOB'],
        businessId: json['businessId'],
        permissions: List<EmployeePermissions>.from(
            json['permissions']?.map((e) => EmployeeRoles.fromJson(e)) ?? []));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> employee = new Map<String, dynamic>();
    employee['email'] = email;
    employee['id'] = id;
    employee['firstName'] = firstName;
    employee['lastName'] = lastName;
    employee['mobile'] = mobile;
    employee['dOB'] = dOB;
    employee['businessId'] = businessId;
    return employee;
  }

  @override
  String toString() {
    return 'Employee{firstName: $firstName,lastName: $lastName, email: $email}';
  }
}
