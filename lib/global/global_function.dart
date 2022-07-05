import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/login/service.dart';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/models/loginmodel.dart';

refreshLogin(BuildContext context) async {
  var account = await context
      .read<LoginService>()
      .logIn(currentLogin.email ?? "", currentLogin.password ?? "");
  currentLogin = account ?? LoginModel();
}
