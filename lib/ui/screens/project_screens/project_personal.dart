import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/project_list/bloc.dart';
import 'package:my_application/bloc/project_list/service.dart';
import 'package:my_application/bloc/project_list/state.dart';
import 'package:my_application/models/employee_model.dart';

class ProjectPersonalScreen extends StatefulWidget {
  const ProjectPersonalScreen({Key? key}) : super(key: key);

  @override
  _ProjectPersonalScreen createState() => _ProjectPersonalScreen();
}

class _ProjectPersonalScreen extends State<ProjectPersonalScreen>
    with TickerProviderStateMixin {
  double topBarOpacity = 0.0;
  List<String> tabs = ["Leads", "supervisors"];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProjectsCubit(repository: context.read<ProjectsService>())
        ..getPersonal(1, tabs[0]),
      child: DefaultTabController(
        length: 2,
        child: Builder(
          builder: (BuildContext context) {
            final TabController tabController =
                DefaultTabController.of(context)!;
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                context
                    .read<ProjectsCubit>()
                    .getPersonal(1, tabs[tabController.index]);
              }
            });
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppTheme.appbarColor,
                iconTheme: const IconThemeData(color: Colors.black),
                bottom: TabBar(indicatorColor: AppTheme.secondaryColor, tabs: [
                  Tab(
                    child: Text(tabs[0], style: AppTheme.title),
                  ),
                  Tab(
                    child: Text(tabs[1], style: AppTheme.title),
                  ),
                ]),
                title: Expanded(
                  child: Text(
                    'Personal',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w700,
                      fontSize: 20 + 6 - 6 * topBarOpacity,
                      letterSpacing: 1.2,
                      color: AppTheme.darkerText,
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: AppTheme.secondaryColor))),
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
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
                                    "Email",
                                    style: AppTheme.listheading,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: PersonalListView())
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PersonalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == ProjectsStatus.projectsError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status == ProjectsStatus.personal) {
          return _buildlist(employees: state.employees);
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
    required this.employees,
  }) : super(key: key);

  List<Employee> employees;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: employees.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: AppTheme.secondaryColor.withOpacity(0.2)))),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: ListTile(
              onTap: () {},
              onLongPress: () {},
              title: SizedBox(
                child: Text(
                  employees[index].firstName! +
                      " " +
                      employees[index].lastName!,
                  maxLines: 3,
                  style: AppTheme.body1,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Center(
                          child: Text(
                            (employees[index].email ?? "NA"),
                            overflow: TextOverflow.visible,
                            style: AppTheme.body1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
