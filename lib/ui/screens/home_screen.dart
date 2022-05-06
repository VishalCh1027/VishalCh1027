import 'dart:async';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:my_application/models/attendance_model.dart';
import 'package:my_application/models/tabIcon_data.dart';
import 'package:my_application/ui/screens/Profile_Details.dart';
import 'package:my_application/ui/screens/Projects.dart';
import 'package:my_application/ui/screens/Purchase.dart';
import 'package:my_application/ui/screens/attendance.dart';
import 'package:my_application/ui/screens/dashboard.dart';
import 'package:my_application/ui/screens/dashboardPage.dart';
import '../../app_theme.dart';
import '../../bottombar/bottom_bar_view.dart';

class AppHomeScreen extends StatefulWidget {
  @override
  _AppHomeScreenState createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  late Timer _everySecond;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container();

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      // setState(() {});
    });

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = Projects(animationController: animationController);
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
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
              tabBody = DashboardPage(animationController: animationController);
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
                  tabBody = Purchases(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = AttendancePage(
                      project: "New Project",
                      animationController: animationController);
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
