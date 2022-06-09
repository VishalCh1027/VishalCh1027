import 'package:flutter/material.dart';
import 'package:my_application/models/project_model.dart';

import '../../Apptheme/app_theme.dart';
import '../../main.dart';

class ProjectListView extends StatefulWidget {
  const ProjectListView({
    Key? key,
  }) : super(key: key);

  @override
  _ProjectListView createState() => _ProjectListView();
}

class _ProjectListView extends State<ProjectListView>
    with TickerProviderStateMixin {
  var projects = List<Project>.from([
    {
      "id": 1,
      "name": "Test project",
      "status": "New",
    },
    {
      "id": 2,
      "name": "Worli Project",
      "status": "New",
    },
    {
      "id": 3,
      "name": "Mumbai Project",
      "status": "New",
    },
    {
      "id": 4,
      "name": "Maharashtra Area",
      "status": "New",
    },
    {
      "id": 5,
      "name": "Lower parel chawl",
      "status": "New",
    }
  ].map((e) => Project.fromJson(e)));

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
        itemCount: projects.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final int count = projects.length > 10 ? 10 : projects.length;

          return ProjectsView(
            projectsListData: projects[index],
          );
        },
      ),
    );
  }
}

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    Key? key,
    this.projectsListData,
  }) : super(key: key);

  final Project? projectsListData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Stack(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: HexColor("#6F72CA").withOpacity(0.6),
                      offset: const Offset(1.1, 4.0),
                      blurRadius: 8.0),
                ],
                gradient: LinearGradient(
                  colors: <HexColor>[
                    HexColor("#1E1466"),
                    HexColor("#6F72CA"),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(54.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 16, right: 16, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      projectsListData!.name ?? "",
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.2,
                        color: AppTheme.white,
                      ),
                    ),
                    // Expanded(
                    //   child: Padding(
                    //     padding:
                    //         const EdgeInsets.only(top: 8, bottom: 8),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //         Text(
                    //           "",
                    //           style: TextStyle(
                    //             fontFamily: AppTheme.fontName,
                    //             fontWeight: FontWeight.w500,
                    //             fontSize: 10,
                    //             letterSpacing: 0.2,
                    //             color: AppTheme.white,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.nearlyWhite,
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppTheme.nearlyBlack.withOpacity(0.4),
                      offset: Offset(8.0, 8.0),
                      blurRadius: 8.0),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  Icons.add,
                  color: HexColor("#6F72CA"),
                  size: 24,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: AppTheme.nearlyWhite.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 0.5,
                    colors: <Color>[
                      Color.fromARGB(255, 226, 240, 105),
                      Color.fromARGB(255, 255, 68, 68)
                    ],
                    tileMode: TileMode.repeated,
                  ).createShader(bounds);
                },
                child: Icon(
                  IconData(0xea17, fontFamily: 'MaterialIcons'),
                  size: 40,
                  color: HexColor("#FFB295"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
