import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/ui/screens/project_screens/project_expenses.dart';
import 'package:my_application/ui/screens/project_screens/project_items_screen.dart';
import 'package:my_application/ui/screens/project_screens/project_personal.dart';
import 'package:my_application/ui/screens/project_screens/projectworkmens.dart';

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
                        builder: (context) => const ProjectPersonalScreen(),
                      ),
                    );
                  },
                  leading: const Icon(
                    FontAwesomeIcons.users,
                  ),
                  title: const Padding(
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
              child: Card(
                child: ListTile(
                  dense: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectWorkmensPage(
                          project: "New Project",
                        ),
                      ),
                    );
                  },
                  leading: const Icon(FontAwesomeIcons.helmetSafety),
                  title: const Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Workmen',
                      style: TextStyle(
                        fontSize: 15,
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
                        builder: (context) => const ProjectExpenseScreen(),
                      ),
                    );
                  },
                  leading: const Icon(FontAwesomeIcons.fileInvoiceDollar),
                  title: const Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Expnenses',
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
                            builder: (context) => const ProjectItemScreen()));
                  },
                  leading: const Icon(
                    Icons.shopping_cart,
                  ),
                  title: const Padding(
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
      height: MediaQuery.of(context).size.height,
      color: AppTheme.background,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Expanded(
            child: Text(
              'Project Overview',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w700,
                fontSize: 28,
                letterSpacing: 1.2,
                color: AppTheme.darkerText,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            children: <Widget>[
              Container(
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
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          project.name ?? "NA",
                          style: const TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            letterSpacing: 0.5,
                            color: AppTheme.nearlyBlack,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
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
                                        const Icon(
                                          Icons.av_timer,
                                          color: AppTheme.deactivatedText,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
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
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            project.status ?? "NA",
                                            style: const TextStyle(
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
                                  padding: const EdgeInsets.only(left: 30),
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
                                                color: AppTheme.deactivatedText,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              project.startDate != null
                                                  ? formatDate
                                                      .format(
                                                          project.startDate ??
                                                              DateTime.now())
                                                      .toString()
                                                  : "NA",
                                              style: const TextStyle(
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
                    const SizedBox(
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
                                      const Icon(
                                        Icons.currency_rupee,
                                        color: AppTheme.deactivatedText,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
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
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          (project.totalCost ?? "NA")
                                              .toString(),
                                          style: const TextStyle(
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
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.currency_rupee,
                                          color: AppTheme.deactivatedText,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
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
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              (project.estimateCost ?? "NA")
                                                  .toString(),
                                              style: const TextStyle(
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
              ),
              getSubView(context),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }
}
