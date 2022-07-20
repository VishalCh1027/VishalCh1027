import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/project_list/bloc.dart';
import 'package:my_application/bloc/project_list/service.dart';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/main.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/ui/screens/project_screens/projectscreen.dart';

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
      "clientId": 1,
      "officeId": 1,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 22,
      "procurementOfficerId": 22,
      "name": "Luxurious 1, 1.5 & 2 BHK Apartments in Vikhroli.",
      "agreement": null,
      "startDate": "2022-05-27T00:00:00",
      "commencementDate": null,
      "estimateCost": 0,
      "totalCost": null,
      "orderAttachment": null,
      "status": "New",
      "client": {
        "id": 1,
        "businessId": 1,
        "addressId": 13,
        "name": "Demo Client",
        "email": "client@gmail.com",
        "phone": "9328832787",
        "gst": "823782378237872",
        "remark": null,
        "business": null,
        "address": null,
        "isActive": false,
        "createdBy": 2,
        "createdAt": "2022-05-27T19:16:29.42",
        "updatedBy": 2,
        "updatedAt": "2022-05-27T20:33:27.177"
      },
      "office": null,
      "technicalHead": null,
      "procurementOfficer": null,
      "projectItems": [],
      "projectExpenses": [],
      "projectBanks": [],
      "projectLeads": [],
      "projectSupervisors": [],
      "projectContractors": [],
      "photos": [],
      "documents": [],
      "isActive": true,
      "createdBy": 2,
      "createdAt": "2022-05-27T19:17:55.853",
      "updatedBy": 22,
      "updatedAt": "2022-06-08T18:10:41.36"
    },
    {
      "id": 2,
      "clientId": 1,
      "officeId": 1,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 22,
      "procurementOfficerId": 22,
      "name": "Eternia At Kalpataru Parkcity",
      "agreement": null,
      "startDate": "2022-05-27T00:00:00",
      "commencementDate": null,
      "estimateCost": 0,
      "totalCost": null,
      "orderAttachment": null,
      "status": "Completed",
      "client": {
        "id": 1,
        "businessId": 1,
        "addressId": 13,
        "name": "Demo Client",
        "email": "client@gmail.com",
        "phone": "9328832787",
        "gst": "823782378237872",
        "remark": null,
        "business": null,
        "address": null,
        "isActive": false,
        "createdBy": 2,
        "createdAt": "2022-05-27T19:16:29.42",
        "updatedBy": 2,
        "updatedAt": "2022-05-27T20:33:27.177"
      },
      "office": null,
      "technicalHead": null,
      "procurementOfficer": null,
      "projectItems": [],
      "projectExpenses": [],
      "projectBanks": [],
      "projectLeads": [],
      "projectSupervisors": [],
      "projectContractors": [],
      "photos": [],
      "documents": [],
      "isActive": true,
      "createdBy": 2,
      "createdAt": "2022-05-27T19:17:55.853",
      "updatedBy": 22,
      "updatedAt": "2022-06-08T18:10:41.36"
    },
    {
      "id": 3,
      "clientId": 1,
      "officeId": 1,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 22,
      "procurementOfficerId": 22,
      "name": "Dinaco Darshan CHSL",
      "agreement": null,
      "startDate": "2022-05-27T00:00:00",
      "commencementDate": null,
      "estimateCost": 0,
      "totalCost": null,
      "orderAttachment": null,
      "status": "New",
      "client": {
        "id": 1,
        "businessId": 1,
        "addressId": 13,
        "name": "Demo Client",
        "email": "client@gmail.com",
        "phone": "9328832787",
        "gst": "823782378237872",
        "remark": null,
        "business": null,
        "address": null,
        "isActive": false,
        "createdBy": 2,
        "createdAt": "2022-05-27T19:16:29.42",
        "updatedBy": 2,
        "updatedAt": "2022-05-27T20:33:27.177"
      },
      "office": null,
      "technicalHead": null,
      "procurementOfficer": null,
      "projectItems": [],
      "projectExpenses": [],
      "projectBanks": [],
      "projectLeads": [],
      "projectSupervisors": [],
      "projectContractors": [],
      "photos": [],
      "documents": [],
      "isActive": true,
      "createdBy": 2,
      "createdAt": "2022-05-27T19:17:55.853",
      "updatedBy": 22,
      "updatedAt": "2022-06-08T18:10:41.36"
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
        child: BlocProvider(
          create: (_) =>
              ProjectsCubit(repository: context.read<ProjectsService>())
                ..getProjects(currentLogin.employee!.id ?? 0),
          child: ListView.builder(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
            itemCount: projects.length > 10 ? 10 : projects.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return ProjectsView(
                projectsListData: projects[index],
              );
            },
          ),
        ));
  }
}

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    Key? key,
    required this.projectsListData,
  }) : super(key: key);

  final Project projectsListData;

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
                gradient: LinearGradient(
                  colors: [
                    AppTheme.secondaryColor,
                    AppTheme.secondaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(54.0),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<Project>(
                      builder: (BuildContext context) {
                        return ProjectScreen(
                          project: projectsListData,
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 40, left: 16, right: 16, bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        projectsListData.name ?? "",
                        maxLines: 5,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 0.2,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const RadialGradient(
                    center: Alignment.topLeft,
                    radius: 0.5,
                    colors: <Color>[
                      Color.fromARGB(255, 255, 68, 68),
                      Color.fromARGB(255, 226, 240, 105),
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
