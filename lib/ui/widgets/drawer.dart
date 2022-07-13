import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/ui/screens/accountscreen.dart';
import 'package:my_application/ui/screens/dashboardscreen.dart';
import 'package:my_application/ui/screens/procurementapprovascreen.dart';
import 'package:my_application/ui/screens/project_screens/projectlistscreen.dart';
import 'package:my_application/ui/screens/purchasesscreen.dart';
import 'package:my_application/ui/screens/technicalheadscreen.dart';
import 'package:my_application/ui/screens/wallet_screen.dart';
import 'package:my_application/ui/widgets/drawer_tile.dart';

class NowDrawer extends StatelessWidget {
  final String currentPage;

  NowDrawer({required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: AppTheme.primaryColor,
      child: Column(children: [
        //Header Section
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.85,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: IconButton(
                          icon: Icon(Icons.menu,
                              color: AppTheme.white.withOpacity(0.82),
                              size: 24.0),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
              ),
            )),

        //Menu Button List
        Expanded(
          flex: 3,
          child: ListView(
            padding: const EdgeInsets.only(top: 36, left: 8, right: 16),
            children: [
              DrawerTile(
                  icon: FontAwesomeIcons.home,
                  onTap: () {
                    if (currentPage != "Dashboard") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen(
                                  changeIndex: (int i) {},
                                )),
                      );
                    }
                  },
                  iconColor: AppTheme.primaryColor,
                  title: "Dashboard",
                  isSelected: currentPage == "Dashboard" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.clipboardUser,
                  onTap: () {
                    if (currentPage != "Attendance") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProjectListScreen(
                                  officeId: 1,
                                  type: PageType.MarkAttendance,
                                )),
                      );
                    }
                  },
                  iconColor: AppTheme.primaryColor,
                  title: "Attendance",
                  isSelected: currentPage == "Attendance" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.cartShopping,
                  onTap: () {
                    if (currentPage != "Purchase Requests") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PurchasesScreen()),
                      );
                    }
                  },
                  iconColor: AppTheme.background,
                  title: "Purchase Requests",
                  isSelected:
                      currentPage == "Purchase Requests" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.fileInvoiceDollar,
                  onTap: () {
                    if (currentPage != "Technical Approvals") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TechnicalHeadScreen()),
                      );
                    }
                  },
                  iconColor: AppTheme.background,
                  title: "Technical Approvals",
                  isSelected:
                      currentPage == "Technical Approvals" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.fileCircleCheck,
                  onTap: () {
                    if (currentPage != "Procurement Approvals") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ProcurementHeadScreen()),
                      );
                    }
                  },
                  iconColor: AppTheme.background,
                  title: "Procurement Approvals",
                  isSelected:
                      currentPage == "Procurement Approvals" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.diagramProject,
                  onTap: () {
                    if (currentPage != "Projects") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProjectListScreen(
                                officeId: 1, type: PageType.ProjectList)),
                      );
                    }
                  },
                  iconColor: AppTheme.background,
                  title: "Projects",
                  isSelected: currentPage == "Projects" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.wallet,
                  onTap: () {
                    if (currentPage != "Wallet") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WalletScreen(),
                        ),
                      );
                    }
                  },
                  iconColor: AppTheme.background,
                  title: "Wallet",
                  isSelected: currentPage == "Wallet" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.user,
                  onTap: () {
                    if (currentPage != "Account") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccountScreen()),
                      );
                    }
                  },
                  iconColor: AppTheme.primaryColor,
                  title: "Account",
                  isSelected: currentPage == "Account" ? true : false),
            ],
          ),
        ),

        //Footer Section
        Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.only(left: 8, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                      height: 4,
                      thickness: 0,
                      color: AppTheme.white.withOpacity(0.8)),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
                    child: Text("More",
                        style: TextStyle(
                          color: AppTheme.white.withOpacity(0.8),
                          fontSize: 13,
                        )),
                  ),
                  DrawerTile(
                      icon: FontAwesomeIcons.satellite,
                      onTap: () {},
                      iconColor: AppTheme.lightText,
                      title: "About Us",
                      isSelected: currentPage == "About Us" ? true : false),
                ],
              )),
        ),
      ]),
    ));
  }
}
