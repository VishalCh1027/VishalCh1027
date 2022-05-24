import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/attendance/bloc.dart';
import 'package:my_application/bloc/attendance/service.dart';
import 'package:my_application/helpers/tabIcon_data.dart';
import 'package:my_application/ui/screens/Profile_Details.dart';
import 'package:my_application/ui/screens/purchasesscreen.dart';
import 'package:my_application/ui/screens/dashboardscreen.dart';
import '../../Apptheme/app_theme.dart';
import '../bottombar/bottom_bar_view.dart';
import 'attendancescreen.dart';

class AppHomeScreen extends StatefulWidget {
  @override
  _AppHomeScreenState createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen>
    with TickerProviderStateMixin {
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });

    tabBody = DashboardScreen();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AttendanceService>.value(
              value: AttendanceService()),
        ],
        child: Container(
          child: Scaffold(
            body: FutureBuilder<bool>(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                } else {
                  return Stack(
                    children: <Widget>[
                      tabBody,
                      bottomBar(),
                    ],
                  );
                }
              },
            ),
          ),
        ));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            setState(() {
              tabIconsList.forEach((TabIconData tab) {
                tab.isSelected = false;
              });
              tabBody = DashboardScreen();
            });
          },
          changeIndex: (int index) {
            if (index == 0) {
              if (!mounted) {
                return;
              }
              setState(() {
                tabBody = Details();
              });
            } else if (index == 2) {
              if (!mounted) {
                return;
              }
              setState(() {
                tabBody = PurchasesScreen();
              });
            } else if (index == 1) {
              if (!mounted) {
                return;
              }
              setState(() {
                tabBody = AttendancePage(
                  project: "New Project",
                );
              });
            } else if (index == 3) {
              if (!mounted) {
                return;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AttendancePage(
                            project: "New Project",
                          )));
            }
          },
        ),
      ],
    );
  }
}
