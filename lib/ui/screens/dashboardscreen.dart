import 'package:flutter/material.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/ui/screens/project_screens/projectlistscreen.dart';
import 'package:my_application/ui/widgets/RequestsView.dart';
import 'package:my_application/ui/widgets/attendance_tile.dart';
import 'package:my_application/ui/widgets/drawer.dart';
import 'package:my_application/ui/widgets/projects_list_view.dart';
import 'package:my_application/ui/widgets/title_view.dart';
import 'package:my_application/ui/widgets/wallet_tile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  _DashboardScreen createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    listViews.add(
      TitleView(
        titleTxt: 'Wallet',
      ),
    );
    listViews.add(
      WalletTileView(),
    );
    listViews.add(
      TitleView(
        titleTxt: 'Purchase Requests',
      ),
    );
    listViews.add(
      RequetsView(
        Action: () {},
      ),
    );
    listViews.add(
      const TitleView(
        titleTxt: 'Attendance',
        istrailing: false,
      ),
    );
    listViews.add(
      AttendanceTileView(),
    );
    listViews.add(
      TitleView(
        titleTxt: 'Projects',
        subTxt: 'View All',
        trailingAction: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProjectListScreen(officeId: 1, type: PageType.ProjectList)),
          );
        },
      ),
    );
    listViews.add(
      const ProjectListView(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        drawer: NowDrawer(currentPage: "Dashboard"),
        appBar: AppBar(
          backgroundColor: AppTheme.appbarColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Image.asset(
            'assets/alyn logo.png',
            fit: BoxFit.contain,
            height: 40,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.only(
        top: 20,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      itemCount: listViews.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return listViews[index];
      },
    );
  }
}
