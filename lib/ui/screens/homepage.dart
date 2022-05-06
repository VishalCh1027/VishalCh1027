import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:my_application/constatnts.dart';
import 'package:my_application/ui/screens/Projects.dart';
import 'package:my_application/ui/screens/Purchase.dart';
import 'package:my_application/ui/screens/attendance.dart';
import 'package:my_application/ui/screens/dashboard.dart';
import 'package:my_application/ui/screens/selectProject.dart';

import '../widgets/account_icon.dart';
import 'Profile_Details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  var projects = ["new ", "Test project", "Mumbai", "ABC", "Maharashtra Area"];
  int _selectedIndex = 2;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.pinned,
          snakeShape: SnakeShape.circle,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.zero,

          ///configuration for SnakeNavigationBar.color
          snakeViewColor: kCaptionColor,
          selectedItemColor: Color.fromRGBO(39, 50, 80, 1),
          unselectedItemColor: Colors.blueGrey,

          ///configuration for SnakeNavigationBar.gradient
          //snakeViewGradient: selectedGradient,
          //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
          //unselectedItemGradient: unselectedGradient,

          showUnselectedLabels: false,
          showSelectedLabels: true,

          currentIndex: _selectedIndex,
          onTap: (index) {
            onTap(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe189, fontFamily: 'MaterialIcons')),
                label: 'Project'),
            BottomNavigationBarItem(
                icon: Icon(IconData(0xf05ef, fontFamily: 'MaterialIcons')),
                label: 'Attendance'),
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe8af, fontFamily: 'MaterialIcons')),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe567, fontFamily: 'MaterialIcons')),
                label: 'Requests'),
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe3dc, fontFamily: 'MaterialIcons')),
                label: 'Menu')
          ],
        ),
        appBar: _selectedIndex == 2
            ? AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  "APP Icon",
                  style: TextStyle(color: kPrimaryColor),
                ),
                backgroundColor: primaryColor,
                actions: [
                  AccountIcon(),
                ],
              )
            : null,
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          controller: _pageController,
          children: [
            Purchases(),
            SelectProject(
              projects: projects,
            ),
            Dashboard(),
            Projects(),
            Details(),
          ],
        ));
  }
}
