import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/ui/screens/projectworkmens.dart';

class ProjectScreen extends StatefulWidget {
  ProjectScreen({Key? key, required this.project});
  final Project project;
  @override
  _ProjectScreen createState() => _ProjectScreen(project);
}

class _ProjectScreen extends State<ProjectScreen>
    with TickerProviderStateMixin {
  _ProjectScreen(this.project);

  final Project project;
  Animation<double>? topBarAnimation;

  final formatDate = DateFormat("dd/MM/yyyy");
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  void initState() {
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

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white.withOpacity(topBarOpacity),
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
                top: 14 - 8.0 * topBarOpacity,
                bottom: 12 - 8.0 * topBarOpacity),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(IconData(0xe092,
                      fontFamily: 'MaterialIcons', matchTextDirection: true)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Project Overview',
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
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: 2,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            project.name ?? "NA",
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              letterSpacing: 0.5,
                              color: AppTheme.nearlyBlack,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          width: 350,
                          height: 60,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.av_timer,
                                            color: AppTheme.deactivatedText,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Status",
                                            style: TextStyle(
                                                color: AppTheme.deactivatedText,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                              project.status ?? "NA",
                                              style: TextStyle(
                                                  color: AppTheme.nearlyBlack,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.av_timer,
                                              color: AppTheme.deactivatedText,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Start Date",
                                              style: TextStyle(
                                                  color:
                                                      AppTheme.deactivatedText,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                project.startDate != null
                                                    ? formatDate
                                                        .format(
                                                            project.startDate ??
                                                                DateTime.now())
                                                        .toString()
                                                    : "NA",
                                                style: TextStyle(
                                                    color: AppTheme.nearlyBlack,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 350,
                        height: 60,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.currency_rupee,
                                          color: AppTheme.deactivatedText,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Total Cost",
                                          style: TextStyle(
                                              color: AppTheme.deactivatedText,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            (project.totalCost ?? "NA")
                                                .toString(),
                                            style: TextStyle(
                                                color: AppTheme.nearlyBlack,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.currency_rupee,
                                            color: AppTheme.deactivatedText,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Estimated Cost",
                                            style: TextStyle(
                                                color: AppTheme.deactivatedText,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                (project.estimateCost ?? "NA")
                                                    .toString(),
                                                style: TextStyle(
                                                    color: AppTheme.nearlyBlack,
                                                    fontSize: 20),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return getSubView(context);
              }
            },
          );
        }
      },
    );
  }

  Widget getSubView(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Card(
                child: ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectWorkmensPage(
                                  project: "New Project",
                                )));
                  },
                  leading: Icon(
                    Icons.supervisor_account,
                  ),
                  title: Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Personal',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProjectWorkmensPage(
                                project: "New Project",
                              )));
                },
                child: Card(
                  child: ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.supervisor_account,
                    ),
                    title: Padding(
                      padding: EdgeInsets.all(1),
                      child: Text(
                        'Workmens',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Card(
                child: ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectWorkmensPage(
                                  project: "New Project",
                                )));
                  },
                  leading: Icon(
                    Icons.request_page,
                  ),
                  title: Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Purchase Requests',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectWorkmensPage(
                                  project: "New Project",
                                )));
                  },
                  leading: Icon(
                    Icons.request_page,
                  ),
                  title: Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Items',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: getMainListViewUI()),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }
}
