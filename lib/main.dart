import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
          title: "Flutter CPMS UI",
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme().copyWith(
              caption: TextStyle(
                color: kCaptionColor,
                fontSize: 16.0,
              ),
            ),
            scaffoldBackgroundColor: kPrimaryColor,
            appBarTheme: AppBarTheme(
              elevation: 0.0,
              color: kPrimaryColor,
            ),
          ),
          home: LoginPage(),
        );
      },
    );
  }
}
