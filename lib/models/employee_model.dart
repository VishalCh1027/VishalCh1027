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
        id: json['id'] as int,
        email: json['email'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        mobile: json['mobile'] as String,
        dOB: json['dOB'] as String,
        businessId: json['businessId'] as int,
        permissions: List<EmployeePermissions>.from(
            json['permissions'].map((e) => EmployeeRoles.fromJson(e))));
  }
  @override
  String toString() {
    return 'Employee{firstName: $firstName,lastName: $lastName, email: $email}';
  }
}
