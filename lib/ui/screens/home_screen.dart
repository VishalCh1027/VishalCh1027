import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_application/models/attendance_model.dart';
import 'package:my_application/helpers/tabIcon_data.dart';
import 'package:my_application/ui/screens/Profile_Details.dart';
import 'package:my_application/ui/screens/Projects.dart';
import 'package:my_application/ui/screens/purchasesscreen.dart';
import 'package:my_application/ui/screens/dashboard.dart';
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
  AnimationController? animationController;

  late Timer _everySecond;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      // setState(() {});
    });

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = DashboardScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
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
              tabBody =
                  DashboardScreen(animationController: animationController);
            });
          },
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = Details(animationController: animationController);
                });
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      PurchasesScreen(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = AttendanceScreen(
                    project: "New Project",
                    animationController: animationController,
                  );
                });
              });
            } else if (index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = Dashboard(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
