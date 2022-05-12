import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_application/constatnts.dart';
import 'package:my_application/models/workmen_model.dart';

import '../../app_theme.dart';
import '../../models/attendance_model.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen(
      {Key? key, required this.project, this.animationController});

  final project;
  final AnimationController? animationController;

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen>
    with TickerProviderStateMixin {
  var projects = ["test project", "new project"];
  TimeOfDay inTime = const TimeOfDay(hour: 9, minute: 30);
  TimeOfDay outTime = const TimeOfDay(hour: 6, minute: 30);
  var workmens = List<Attendance>.from([
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 1,
        "bankId": 205,
        "businessId": 3,
        "departmentId": 1,
        "firstName": "vinod lakhavathula kumar varun",
        "lastName": "h",
        "designation": "IT",
        "email": "shruti@gmail.com",
        "mobile": "9328893289",
        "emergencyContact": "9889437883",
        "emergencyPerson": "vishal",
        "dailyRate": 3232787.83,
        "overtimeRate": 9328893.28,
        "pan": "3273278328",
        "aadharCard": "3289328989238989",
        "bank": null,
        "department": null,
        "isActive": true,
        "createdBy": 3,
        "createdAt": "2022-03-15T14:30:48.3415659",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T21:15:44.051939"
      },
      "workmenId": 1,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 2,
        "bankId": 205,
        "businessId": 3,
        "departmentId": 1,
        "firstName": "Abhinav",
        "lastName": "h",
        "designation": "IT",
        "email": "shruti@gmail.com",
        "mobile": "9328893289",
        "emergencyContact": "9889437883",
        "emergencyPerson": "vishal",
        "dailyRate": 3232787.83,
        "overtimeRate": 9328893.28,
        "pan": "3273278328",
        "aadharCard": "3289328989238989",
        "bank": null,
        "department": null,
        "isActive": true,
        "createdBy": 3,
        "createdAt": "2022-03-15T14:30:48.3415659",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T21:15:44.051939"
      },
      "workmenId": 2,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 3,
        "bankId": 205,
        "businessId": 3,
        "departmentId": 1,
        "firstName": "Pankaj",
        "lastName": "h",
        "designation": "IT",
        "email": "shruti@gmail.com",
        "mobile": "9328893289",
        "emergencyContact": "9889437883",
        "emergencyPerson": "vishal",
        "dailyRate": 3232787.83,
        "overtimeRate": 9328893.28,
        "pan": "3273278328",
        "aadharCard": "3289328989238989",
        "bank": null,
        "department": null,
        "isActive": true,
        "createdBy": 3,
        "createdAt": "2022-03-15T14:30:48.3415659",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T21:15:44.051939"
      },
      "workmenId": 3,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 4,
        "bankId": 236,
        "businessId": 3,
        "departmentId": 1,
        "firstName": "komal",
        "lastName": "I",
        "designation": "IT",
        "email": "komal@gmail.com",
        "mobile": "9839832889",
        "emergencyContact": "2893298893",
        "emergencyPerson": "rahul",
        "dailyRate": 3283872.38,
        "overtimeRate": 3896598.59,
        "pan": "8932832898",
        "aadharCard": "3889238932898932",
        "bank": null,
        "department": null,
        "isActive": true,
        "createdBy": 3,
        "createdAt": "2022-03-15T14:35:21.3283332",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T21:15:44.7674043"
      },
      "workmenId": 4,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 20,
        "bankId": 218,
        "businessId": 3,
        "departmentId": 7,
        "firstName": "Atul",
        "lastName": "test",
        "designation": "labour",
        "email": "tes@gmail.com",
        "mobile": "9283923898",
        "emergencyContact": "8298238238",
        "emergencyPerson": "vishal",
        "dailyRate": null,
        "overtimeRate": 2378.72,
        "pan": "ghsghd2898",
        "aadharCard": "2372636236732676",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 3,
        "createdAt": "2022-03-21T19:54:53.7915674",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T21:15:36.5767997"
      },
      "workmenId": 20,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 21,
        "bankId": 219,
        "businessId": 3,
        "departmentId": 5,
        "firstName": "Akshay",
        "lastName": "test",
        "designation": "test",
        "email": "tst@gmail.com",
        "mobile": "9832989238",
        "emergencyContact": "2382389238",
        "emergencyPerson": "vishal",
        "dailyRate": 289328.98,
        "overtimeRate": 238787.37,
        "pan": "2332877872",
        "aadharCard": "3287327732783278",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 3,
        "createdAt": "2022-03-22T14:05:11.0853499",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T20:54:12.4815173"
      },
      "workmenId": 21,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 21,
        "bankId": 219,
        "businessId": 3,
        "departmentId": 5,
        "firstName": "Manoj",
        "lastName": "test",
        "designation": "test",
        "email": "tst@gmail.com",
        "mobile": "9832989238",
        "emergencyContact": "2382389238",
        "emergencyPerson": "vishal",
        "dailyRate": 289328.98,
        "overtimeRate": 238787.37,
        "pan": "2332877872",
        "aadharCard": "3287327732783278",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 3,
        "createdAt": "2022-03-22T14:05:11.0853499",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T20:54:12.4815173"
      },
      "workmenId": 21,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 21,
        "bankId": 219,
        "businessId": 3,
        "departmentId": 5,
        "firstName": "Ajay",
        "lastName": "test",
        "designation": "test",
        "email": "tst@gmail.com",
        "mobile": "9832989238",
        "emergencyContact": "2382389238",
        "emergencyPerson": "vishal",
        "dailyRate": 289328.98,
        "overtimeRate": 238787.37,
        "pan": "2332877872",
        "aadharCard": "3287327732783278",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 3,
        "createdAt": "2022-03-22T14:05:11.0853499",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T20:54:12.4815173"
      },
      "workmenId": 21,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 21,
        "bankId": 219,
        "businessId": 3,
        "departmentId": 5,
        "firstName": "Ramesh",
        "lastName": "test",
        "designation": "test",
        "email": "tst@gmail.com",
        "mobile": "9832989238",
        "emergencyContact": "2382389238",
        "emergencyPerson": "vishal",
        "dailyRate": 289328.98,
        "overtimeRate": 238787.37,
        "pan": "2332877872",
        "aadharCard": "3287327732783278",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 3,
        "createdAt": "2022-03-22T14:05:11.0853499",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T20:54:12.4815173"
      },
      "workmenId": 21,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 21,
        "bankId": 219,
        "businessId": 3,
        "departmentId": 5,
        "firstName": "Suresh",
        "lastName": "test",
        "designation": "test",
        "email": "tst@gmail.com",
        "mobile": "9832989238",
        "emergencyContact": "2382389238",
        "emergencyPerson": "vishal",
        "dailyRate": 289328.98,
        "overtimeRate": 238787.37,
        "pan": "2332877872",
        "aadharCard": "3287327732783278",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 3,
        "createdAt": "2022-03-22T14:05:11.0853499",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T20:54:12.4815173"
      },
      "workmenId": 21,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 21,
        "bankId": 219,
        "businessId": 3,
        "departmentId": 5,
        "firstName": "Ajay",
        "lastName": "test",
        "designation": "test",
        "email": "tst@gmail.com",
        "mobile": "9832989238",
        "emergencyContact": "2382389238",
        "emergencyPerson": "vishal",
        "dailyRate": 289328.98,
        "overtimeRate": 238787.37,
        "pan": "2332877872",
        "aadharCard": "3287327732783278",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 3,
        "createdAt": "2022-03-22T14:05:11.0853499",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T20:54:12.4815173"
      },
      "workmenId": 21,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 22,
        "bankId": 219,
        "businessId": 3,
        "departmentId": 5,
        "firstName": "Ajay",
        "lastName": "test",
        "designation": "test",
        "email": "tst@gmail.com",
        "mobile": "9832989238",
        "emergencyContact": "2382389238",
        "emergencyPerson": "vishal",
        "dailyRate": 289328.98,
        "overtimeRate": 238787.37,
        "pan": "2332877872",
        "aadharCard": "3287327732783278",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 3,
        "createdAt": "2022-03-22T14:05:11.0853499",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T20:54:12.4815173"
      },
      "workmenId": 22,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 23,
        "bankId": 219,
        "businessId": 3,
        "departmentId": 5,
        "firstName": "Ajay",
        "lastName": "test",
        "designation": "test",
        "email": "tst@gmail.com",
        "mobile": "9832989238",
        "emergencyContact": "2382389238",
        "emergencyPerson": "vishal",
        "dailyRate": 289328.98,
        "overtimeRate": 238787.37,
        "pan": "2332877872",
        "aadharCard": "3287327732783278",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 3,
        "createdAt": "2022-03-22T14:05:11.0853499",
        "updatedBy": 3,
        "updatedAt": "2022-04-18T20:54:12.4815173"
      },
      "workmenId": 23,
      "projectId": 60,
      "overTime": 0,
    }
  ].map((e) => Attendance.fromJson(e)));

  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
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
    const int count = 2;
    var animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.animationController!,
        curve:
            const Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn)));
    listViews.add(AnimatedBuilder(
        animation: widget.animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: animation,
              child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation.value), 0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Divider(
                          color: Color.fromRGBO(97, 99, 119, 1),
                        ),
                      ),
                      _buildHead()
                    ],
                  )));
        }));

    listViews.add(AnimatedBuilder(
        animation: widget.animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: animation,
              child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation.value), 0.0),
                  child: Column(
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
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        child: Center(
                                            child: const Text(
                                          "In Time",
                                          style: AppTheme.listheading,
                                        )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Center(
                                          child: const Text("Hours",
                                              style: AppTheme.listheading),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Expanded(child: Column(children: [_buildlist()]))
                          ]))
                    ],
                  )));
        }));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
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
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
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
                                  'ATTENDANCE',
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
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () {},
                                child: Center(),
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
                                      IconData(0xe531,
                                          fontFamily: 'MaterialIcons'),
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              AttendanceScreen(
                                            project: widget.project,
                                            animationController:
                                                widget.animationController,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      IconData(0xe156,
                                          fontFamily: 'MaterialIcons'),
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
                ),
              ),
            );
          },
        )
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
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHead() {
    return ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(widget.project,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w700,
                fontSize: 17,
                letterSpacing: 1.2,
                color: AppTheme.darkerText,
              )),
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
                child: Text(
              DateFormat("dd-MM-yyyy").format(DateTime.now()),
              style: AppTheme.listheading,
            )),
          ),
        ]));
  }

  Widget _buildlist() {
    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: workmens.length,
            itemBuilder: (context, index) {
              return Card(
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  child: Container(
                decoration: workmens[index].selected!
                    ? BoxDecoration(
                        border: Border(
                        right: BorderSide(
                            width: 5.0, color: AppTheme.nearlyDarkBlue),
                      ))
                    : BoxDecoration(),
                child: ListTile(
                  onTap: () {
                    widget.animationController?.fling().then<dynamic>((data) {
                      setState(() {
                        workmens[index].selected = !workmens[index].selected!;
                      });
                    });
                  },
                  title: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      workmens[index].workmen!.firstname,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: const Text('Select Project'),
                                    content: _buildTransfPage());
                              });
                        },
                        icon: Icon(
                          FontAwesomeIcons.rightLeft,
                          size: 13,
                          color: AppTheme.nearlyDarkBlue,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 10),
                      child: TextButton(
                        child: Text(
                            workmens[index].in_?.format(context) ??
                                inTime.format(context),
                            style: TextStyle(color: AppTheme.nearlyDarkBlue)),
                        onPressed: () {
                          _selectInTime(context, workmens[index]);
                        },
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: DropdownButton(
                            menuMaxHeight: 150,
                            value: workmens[index].hoursWorked ?? 8,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            onChanged: (int? value) {
                              widget.animationController
                                  ?.fling()
                                  .then<dynamic>((data) {
                                setState(() {
                                  workmens[index].selected = true;
                                  workmens[index].hoursWorked = value;
                                });
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                child: Text("4"),
                                value: 4,
                              ),
                              DropdownMenuItem(
                                child: Text("8"),
                                value: 8,
                              ),
                              DropdownMenuItem(
                                child: Text("12"),
                                value: 12,
                              ),
                              DropdownMenuItem(
                                child: Text("16"),
                                value: 16,
                              ),
                              DropdownMenuItem(
                                child: Text("20"),
                                value: 20,
                              ),
                              DropdownMenuItem(
                                child: Text("24"),
                                value: 24,
                              )
                            ]))
                  ]),
                ),
              ));
            }));
  }

  Widget _buildTransfPage() {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
          color: Colors.grey[50],
          height: 190, // MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Text(projects[index]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                AttendanceScreen(project: projects[index]))));
                  },
                ));
              }))
    ]));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        "ATTENDANCE",
        style: pageTitle,
      ),
      actions: [
        IconButton(
          icon: Icon(
            IconData(0xe531, fontFamily: 'MaterialIcons'),
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    AttendanceScreen(project: widget.project),
              ),
            );
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
      centerTitle: true,
      backgroundColor: kCaptionColor,
    );
  }

  Future<void> _selectInTime(
      BuildContext context, Attendance attendance) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: attendance.in_ ?? inTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    // ignore: unnecessary_null_comparison
    if (timeOfDay != null && timeOfDay != attendance.in_) {
      widget.animationController?.fling().then<dynamic>((data) {
        setState(() {
          var index = workmens.indexWhere(
              (element) => element.workmenId == attendance.workmenId);

          workmens[index].in_ = timeOfDay;
          workmens[index].selected = true;
        });
      });
    }
  }

  Future<void> _selectOutTime(
      BuildContext context, Attendance attendance) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: attendance.out ?? outTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    // ignore: unnecessary_null_comparison
    if (timeOfDay != null && timeOfDay != attendance.out) {
      widget.animationController?.fling().then<dynamic>((data) {
        setState(() {
          var index = workmens.indexWhere(
              (element) => element.workmenId == attendance.workmenId);
          workmens[index].out = timeOfDay;
          workmens[index].selected = true;
        });
      });
    }
  }
}
