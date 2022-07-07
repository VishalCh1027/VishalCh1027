import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/attendance/service.dart';
import 'package:my_application/bloc/project_list/bloc.dart';
import 'package:my_application/bloc/project_list/service.dart';
import 'package:my_application/bloc/project_list/state.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/ui/screens/attendancescreen.dart';
import 'package:my_application/ui/screens/projectscreen.dart';

enum PageType { ProjectList, TransferWorkmen, MarkAttendance }

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen(
      {Key? key, required this.officeId, required this.type, this.workmenId})
      : super(key: key);
  final int officeId;
  final PageType type;
  final int? workmenId;
  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
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
                        top: 12 - 8.0 * topBarOpacity,
                        bottom: 10 - 8.0 * topBarOpacity),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.type == PageType.ProjectList
                                  ? 'Projects'
                                  : "Select Project",
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
                                  Icons.filter_alt,
                                  color: AppTheme.primaryColor,
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
              ProjectsCubit(repository: context.read<ProjectsService>())
                ..getProjects(1),
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
                        _buildHead()
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
                                        SizedBox(
                                          width: 100,
                                          child: Center(
                                            child: Text("Status",
                                                style: AppTheme.listheading),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Expanded(
                                  child: Column(children: [
                                ProjectlistVIew(type: widget.type)
                              ]))
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

class _buildHead extends StatelessWidget {
  const _buildHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Icon(
        Icons.search,
        color: Colors.black,
        size: 28,
      ),
      title: TextField(
        onChanged: (value) {
          if (value.length > 1) {
            context.read<ProjectsCubit>().searchProject(value);
          } else {
            context.read<ProjectsCubit>().getProjects(1);
          }
        },
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

class ProjectlistVIew extends StatelessWidget {
  const ProjectlistVIew({Key? key, required this.type, this.workmenId})
      : super(key: key);

  final PageType type;
  final int? workmenId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == ProjectsStatus.projectsError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status == ProjectsStatus.projectsLoadedSuccessfully) {
          return _buildlist(
              projects: state.projects, type: type, workmenId: workmenId);
        } else if (state.status == ProjectsStatus.projectsEditing) {
          return _buildlist(
              projects: state.projects, type: type, workmenId: workmenId);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _buildlist extends StatelessWidget {
  _buildlist(
      {Key? key, required this.projects, required this.type, this.workmenId})
      : super(key: key);

  final PageType type;
  final List<Project> projects;
  final int? workmenId;

  Future _openProject(Project project, BuildContext context) async {
    Project? request = await Navigator.of(context).push(
      new MaterialPageRoute<Project>(
          builder: (BuildContext context) {
            return new ProjectScreen(
              project: project,
            );
          },
          fullscreenDialog: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
              child: Container(
            child: ListTile(
              onTap: () {
                switch (type) {
                  case PageType.ProjectList:
                    _openProject(projects[index], context);
                    break;
                  case PageType.MarkAttendance:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttendanceScreen(
                                  project: projects[index],
                                )));
                    break;
                  case PageType.TransferWorkmen:
                    var result = context
                        .read<AttendanceService>()
                        .transferWorkmen(
                            projects[index].id ?? 0, workmenId ?? 0);
                    Navigator.of(context).pop(result != null);
                    break;
                  default:
                }
              },
              title: SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Text(
                  projects[index].name ?? "",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  width: 100,
                  child: Center(
                    child: Text((projects[index].status ?? "").toString(),
                        style: TextStyle(color: AppTheme.primaryColor)),
                  ),
                ),
              ]),
            ),
          ));
        },
      ),
    );
  }
}
