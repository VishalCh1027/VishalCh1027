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
                  leading: const Icon(FontAwesomeIcons.users,
                      color: AppTheme.secondaryColor),
                  title: const Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Personal',
                      style: AppTheme.body2,
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
                  leading: const Icon(FontAwesomeIcons.helmetSafety,
                      color: AppTheme.secondaryColor),
                  title: const Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Workmen',
                      style: AppTheme.body2,
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
                  leading: const Icon(FontAwesomeIcons.fileInvoiceDollar,
                      color: AppTheme.secondaryColor),
                  title: const Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Expenses',
                      style: AppTheme.body2,
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
                  leading: const Icon(Icons.shopping_cart,
                      color: AppTheme.secondaryColor),
                  title: const Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Items',
                      style: AppTheme.body2,
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
          backgroundColor: AppTheme.background,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Expanded(
            child: Text(
              'Project Overview',
              textAlign: TextAlign.left,
              style: AppTheme.headline,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppTheme.secondaryColor.withOpacity(0.1),
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
                        padding: const EdgeInsets.only(left: 5, top: 10),
                        child: Text(
                          project.name ?? "NA",
                          style: AppTheme.headline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 350,
                        height: 140,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                          child: const Icon(
                                            Icons.person,
                                            color: AppTheme.deactivatedText,
                                            size: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 125,
                                          child: const Text(
                                            "Client",
                                            style: AppTheme.body2,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Text(
                                            project.clientName ?? "NA",
                                            style: AppTheme.body2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                          child: const Icon(
                                            Icons.timer,
                                            color: AppTheme.deactivatedText,
                                            size: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 125,
                                          child: const Text(
                                            "Status",
                                            style: AppTheme.body2,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Text(
                                            project.status ?? "NA",
                                            style: AppTheme.body2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                          child: const Icon(
                                            Icons.calendar_month,
                                            color: AppTheme.deactivatedText,
                                            size: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 125,
                                          child: Text(
                                            "Start Date",
                                            style: AppTheme.body2,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 0),
                                          child: Text(
                                            project.startDate != null
                                                ? formatDate
                                                    .format(project.startDate ??
                                                        DateTime.now())
                                                    .toString()
                                                : "NA",
                                            style: AppTheme.body2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                          child: const Icon(
                                            Icons.currency_rupee,
                                            color: AppTheme.deactivatedText,
                                            size: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 125,
                                          child: Text(
                                            "Total Cost",
                                            style: AppTheme.body2,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 0),
                                          child: Text(
                                            (project.totalCost ?? "NA")
                                                .toString(),
                                            style: AppTheme.body2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                          child: const Icon(
                                            Icons.currency_rupee,
                                            color: AppTheme.deactivatedText,
                                            size: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 125,
                                          child: Text(
                                            "Estimated Cost",
                                            style: AppTheme.body2,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 0),
                                          child: Text(
                                            (project.estimateCost ?? "NA")
                                                .toString(),
                                            style: AppTheme.body2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
