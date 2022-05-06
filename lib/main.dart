import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_application/app_theme.dart';
import 'package:my_application/constatnts.dart';
import 'login_page.dart';
//import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "CPMS UI",
          themeMode: ThemeMode.system,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: AppTheme.textTheme,
            scaffoldBackgroundColor: bgColor,
            appBarTheme: AppBarTheme(
              elevation: 0.0,
              color: primaryColor,
            ),
          ),
          home: LoginPage(),
        );
      },
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
