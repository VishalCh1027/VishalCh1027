import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_application/Apptheme/constatnts.dart';
import 'package:my_application/bloc/attendance/bloc.dart';
import 'package:my_application/bloc/attendance/event.dart';
import 'package:my_application/bloc/attendance/service.dart';
import 'package:my_application/bloc/attendance/state.dart';
import 'package:my_application/models/workmen_model.dart';

import '../../Apptheme/app_theme.dart';
import '../../models/attendance_model.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({
    Key? key,
    required this.project,
  }) : super(key: key);
  final project;
  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
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
    return Column(children: <Widget>[
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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AttendancePage(
                                  project: widget.project,
                                ),
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
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (_) =>
              AttendanceCubit(repository: context.read<AttendanceService>())
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
                        _buildHead(
                          project: projects[0],
                        )
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
                                  child:
                                      Column(children: [AttendanceListVIew()]))
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
                            builder: ((context) => AttendancePage(
                                  project: projects[index],
                                ))));
                  },
                ));
              }))
    ]));
  }
}

class _buildHead extends StatelessWidget {
  const _buildHead({Key? key, required this.project}) : super(key: key);

  final project;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(project,
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
}

class AttendanceListVIew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<AttendanceCubit>().state;
    if (state.status == AttendanceStatus.AttendanceError) {
      return const Center(child: Text('Oops something went wrong!'));
    } else if (state.status == AttendanceStatus.AttendanceLoadedSuccessfully) {
      return _buildlist(workmens: state.attendance);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}

class _buildlist extends StatelessWidget {
  _buildlist({
    Key? key,
    required this.workmens,
  }) : super(key: key);
  final List<Attendance> workmens;
  TimeOfDay inTime = const TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectInTime(
      BuildContext context, Attendance attendance) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: attendance.in_ ?? inTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    // ignore: unnecessary_null_comparison
    if (timeOfDay != null && timeOfDay != attendance.in_) {
      attendance.in_ = timeOfDay;
      context.read<AttendanceCubit>().updatelist(attendance);
    }
  }

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
                  workmens[index].workmen!.firstname,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.multiple_stop_rounded,
                      size: 20,
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
                          workmens[index].hoursWorked = value;
                          context
                              .read<AttendanceCubit>()
                              .updatelist(workmens[index]);
                        },
                        items: const [
                          DropdownMenuItem(
                            child: Text("0"),
                            value: 0,
                          ),
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
        },
      ),
    );
  }
}
