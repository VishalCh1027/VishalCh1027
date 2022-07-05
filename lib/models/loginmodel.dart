import 'dart:convert';

import 'package:my_application/models/employee_model.dart';

class LoginModel {
  String? email;
  String? password;
  String? token;
  Employee? employee;

  LoginModel({
    this.email,
    this.password,
    this.employee,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'] as String;
    password = json['password'] as String;
    employee = json['employee'] != null
        ? Employee.fromJson(jsonDecode(json['employee']))
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> login = new Map<String, dynamic>();
    login['email'] = email;
    login['password'] = password;
    login['employee'] = jsonEncode(employee);
    return login;
  }
}
