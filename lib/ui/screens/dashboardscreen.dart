import 'package:flutter/material.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/ui/screens/project_screens/projectlistscreen.dart';
import 'package:my_application/ui/screens/purchasesscreen.dart';
import 'package:my_application/ui/widgets/RequestsView.dart';
import 'package:my_application/ui/widgets/attendance_tile.dart';
import 'package:my_application/ui/widgets/drawer.dart';
import 'package:my_application/ui/widgets/projects_list_view.dart';
import 'package:my_application/ui/widgets/title_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, required this.changeIndex})
      : super(key: key);
  final Function(int index) changeIndex;
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
        titleTxt: 'Requests',
        subTxt: 'Show All',
        trailingAction: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PurchasesScreen()),
          );
        },
      ),
    );
    listViews.add(
      RequetsView(
        Action: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PurchasesScreen()),
          );
        },
      ),
    );
    listViews.add(
      TitleView(
        titleTxt: 'Projects',
        subTxt: 'Show All',
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
    listViews.add(
      const TitleView(
        titleTxt: 'Attendance',
        istrailing: false,
      ),
    );
    listViews.add(
      AttendanceTileView(),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        drawer: NowDrawer(currentPage: "Dashboard"),
        appBar: AppBar(
          backgroundColor: AppTheme.nearlyWhite,
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
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
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
      },
    );
  }

  Widget getAppBarUI() {
    return Column(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: AppTheme.secondaryColor.withOpacity(topBarOpacity),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16 - 8.0 * topBarOpacity,
                  bottom: 12 - 8.0 * topBarOpacity),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: Icon(IconData(0xe3dc, fontFamily: 'MaterialIcons')),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NowDrawer(
                                    currentPage: "Dashboard",
                                  )),
                        );
                      }),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'My App',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w700,
                          fontSize: 22 + 6 - 6 * topBarOpacity,
                          letterSpacing: 1.2,
                          color: AppTheme.darkerText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
