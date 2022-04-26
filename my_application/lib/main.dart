import 'package:flutter/material.dart';
import 'login_page.dart';
//import 'dashboard.dart';

void main() {
    runApp(const MaterialApp(
    title: 'Login app',
    home:  LoginPage(),
    debugShowCheckedModeBanner: false, 
    themeMode:ThemeMode.system,
  ));
}
