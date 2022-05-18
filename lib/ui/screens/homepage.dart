import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_application/Apptheme/constatnts.dart';
import 'package:my_application/ui/screens/Projects.dart';
import 'package:my_application/ui/screens/dashboard.dart';
import 'package:my_application/ui/screens/selectProject.dart';

import '../widgets/account_icon.dart';
import 'Profile_Details.dart';
import 'Purchasesscreen.dart';

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
            PurchasesScreen(),
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
