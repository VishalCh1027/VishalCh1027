import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/workmen_list/bloc.dart';
import 'package:my_application/bloc/workmen_list/service.dart';
import 'package:my_application/bloc/workmen_list/state.dart';
import 'package:my_application/models/workmen_model.dart';

class ProjectWorkmensPage extends StatefulWidget {
  const ProjectWorkmensPage({Key? key, required this.project})
      : super(key: key);
  final project;
  @override
  State<ProjectWorkmensPage> createState() => _ProjectWorkmensState();
}

class _ProjectWorkmensState extends State<ProjectWorkmensPage> {
  var projects = ["test project", "new project"];
  Animation<double>? topBarAnimation;
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
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
    // TODO: implement dispose
    super.dispose();
  }

  Widget getAppBarUI() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Container(
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Workmen',
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
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                          ),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  IconData(0xe531, fontFamily: 'MaterialIcons'),
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  context.read<WorkmenCubit>().getWorkmens(1);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  IconData(0xe156, fontFamily: 'MaterialIcons'),
                                  color: Colors.lightGreenAccent[700],
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (_) =>
              WorkmenCubit(repository: context.read<WorkmenService>())
                ..getWorkmens(1),
          child: Stack(
            children: <Widget>[
              ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.only(
                  top: AppBar().preferredSize.height +
                      MediaQuery.of(context).padding.top +
                      24,
                  bottom: 100,
                ),
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Divider(
                            color: Color.fromRGBO(97, 99, 119, 1),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height - 100,
                            width: MediaQuery.of(context).size.width - 40,
                            child: Column(children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  dense: true,
                                  title: const Text(
                                    "Name",
                                    style: AppTheme.listheading,
                                  ),
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 40),
                                          child: Center(
                                              child: Text(
                                            "In Time",
                                            style: AppTheme.listheading,
                                          )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Center(
                                            child: Text("Hours",
                                                style: AppTheme.listheading),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Expanded(
                                  child: Column(children: [WorkmenListVIew()]))
                            ]))
                      ],
                    )
                  ]);
                },
              ),
              getAppBarUI(),
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

class WorkmenListVIew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkmenCubit, WorkmenState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == WorkmenStatus.WorkmenError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status == WorkmenStatus.WorkmenLoaded) {
          return _buildlist(workmens: state.workmens);
        } else if (state.status == WorkmenStatus.WorkmenEdited) {
          return _buildlist(workmens: state.workmens);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _buildlist extends StatelessWidget {
  _buildlist({
    Key? key,
    required this.workmens,
  }) : super(key: key);
  final List<Workmen> workmens;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: workmens.length,
        itemBuilder: (context, index) {
          return Card(
              child: Container(
            child: ListTile(
              onTap: () {},
              title: SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Text(
                  workmens[index].firstname + workmens[index].lastname,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
