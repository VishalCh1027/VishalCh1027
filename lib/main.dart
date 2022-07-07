import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_application/Apptheme/constatnts.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/login/service.dart';
import 'package:my_application/bloc/project_list/service.dart';
import 'package:my_application/bloc/purchases/service.dart';
import 'package:my_application/bloc/workmen_list/service.dart';
import 'package:my_application/global/global_function.dart';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/ui/screens/home_screen.dart';
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
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
              RepositoryProvider<LoginService>.value(value: LoginService()),
              RepositoryProvider<AttendanceService>.value(
                  value: AttendanceService()),
              RepositoryProvider<PurchasesService>.value(
                  value: PurchasesService()),
              RepositoryProvider<ProjectsService>.value(
                  value: ProjectsService()),
              RepositoryProvider<WorkmenService>.value(value: WorkmenService()),
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
                home: LoadingScreen()),
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

class LoadingScreen extends StatefulWidget {
  static const routeName = 'loading';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load().then((value) {
      if (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (b) => AppHomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (b) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }

  Future<bool> load() async {
    await getGlobal();
    await refreshLogin(context);
    if (currentLogin.email == null) {
      return false;
    }
    return true;
  }
}
