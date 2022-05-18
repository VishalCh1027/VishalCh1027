import 'dart:convert';

class LoginModel {
  String? email;
  String? password;
  String? token;

  LoginModel({
    this.email,
    this.password,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'] as String;
    password = json['password'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> login = new Map<String, dynamic>();
    login['email'] = this.email;
    login['password'] = this.password;
    return login;
  }
}
