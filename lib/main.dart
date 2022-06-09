import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_application/Apptheme/app_theme.dart';
import 'package:my_application/Apptheme/constatnts.dart';
import 'package:my_application/bloc/Attendance/event.dart';
import 'package:my_application/bloc/project_list/service.dart';
import 'package:my_application/bloc/purchases/service.dart';
import 'bloc/attendance/service.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (_) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider<AttendanceService>.value(
                  value: AttendanceService()),
              RepositoryProvider<PurchasesService>.value(
                  value: PurchasesService()),
              RepositoryProvider<ProjectsService>.value(
                  value: ProjectsService()),
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "CPMS UI",
                themeMode: ThemeMode.system,
                theme: ThemeData(
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: AppTheme.textTheme,
                  scaffoldBackgroundColor: bgColor,
                  appBarTheme: AppBarTheme(
                    elevation: 0.0,
                    color: AppTheme.white,
                  ),
                ),
                home: LoginPage()),
          );
        });
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
