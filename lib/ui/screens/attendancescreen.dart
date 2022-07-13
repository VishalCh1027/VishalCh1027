import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/attendance/bloc.dart';
import 'package:my_application/bloc/attendance/state.dart';
import 'package:my_application/bloc/workmen_list/service.dart';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/ui/screens/project_screens/projectlistscreen.dart';

import '../../models/attendance_model.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key, required this.project}) : super(key: key);
  final Project project;
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  Animation<double>? topBarAnimation;
  double topBarOpacity = 0.0;

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
    return Container(
      color: AppTheme.background,
      child: BlocProvider(
        create: (_) =>
            AttendanceCubit(repository: context.read<WorkmenService>())
              ..getWorkmens(1),
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            toolbarHeight: 80,
            title: const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(
                  "Attendance",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w700,
                    fontSize: 20 + 6 + 6,
                    letterSpacing: 1.2,
                    color: AppTheme.darkerText,
                  ),
                ),
              ),
            ),
            actions: [_ActionButtons(context)],
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              ListView.builder(
                padding: const EdgeInsets.only(),
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Column(
                        children: [_buildHead(project: widget.project)],
                      ),
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height - 150,
                            width: MediaQuery.of(context).size.width - 40,
                            child: Column(
                              children: [
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
                                          padding: EdgeInsets.only(right: 35),
                                          child: Center(
                                              child: Text(
                                            "Shift",
                                            style: AppTheme.listheading,
                                          )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 0),
                                          child: Center(
                                            child: Text("Present",
                                                style: AppTheme.listheading),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      AttendanceListVIew(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _ActionButtons(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return index == 1
            ? Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                  icon: Icon(
                    const IconData(0xe156, fontFamily: 'MaterialIcons'),
                    size: 30,
                    color: Colors.lightGreenAccent[700],
                  ),
                  onPressed: () {},
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: const Icon(
                    IconData(0xe531, fontFamily: 'MaterialIcons'),
                    color: Colors.blue,
                    size: 30,
                  ),
                  onPressed: () {
                    context.read<AttendanceCubit>().getWorkmens(1);
                  },
                ),
              );
      },
    );
  }
}

class _buildHead extends StatelessWidget {
  const _buildHead({Key? key, required this.project}) : super(key: key);

  final project;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            project.name,
            style: const TextStyle(
              fontFamily: AppTheme.fontName,
              fontWeight: FontWeight.w700,
              fontSize: 17,
              letterSpacing: 1.2,
              color: AppTheme.darkerText,
            ),
          ),
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
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == AttendanceStatus.AttendanceError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status == AttendanceStatus.AttendanceLoaded) {
          return _buildlist(workmens: state.attendance);
        } else if (state.status == AttendanceStatus.AttendanceEdited) {
          return _buildlist(workmens: state.attendance);
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
  final List<Attendance> workmens;
  TimeOfDay inTime = const TimeOfDay(hour: 9, minute: 30);

  // Future<void> _selectInTime(
  //     BuildContext context, Attendance attendance) async {
  //   final TimeOfDay? timeOfDay = await showTimePicker(
  //     context: context,
  //     initialTime: attendance.in_ ?? inTime,
  //     initialEntryMode: TimePickerEntryMode.dial,
  //   );
  //   // ignore: unnecessary_null_comparison
  //   if (timeOfDay != null && timeOfDay != attendance.in_) {
  //     context.read<AttendanceCubit>().updateInTime(attendance, timeOfDay);
  //   }
  // }

  Future _transferWorkmen(Attendance attendance, BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute<bool>(
          builder: (BuildContext context) {
            return ProjectListScreen(
                officeId: currentOffice.id ?? 0,
                type: PageType.TransferWorkmen,
                workmenId: attendance.workmen!.id);
          },
          fullscreenDialog: true),
    );

    if (result == true) {
      workmens.remove(attendance);
      context.read<AttendanceCubit>().updateList(workmens);
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: result == true
            ? const Text("Workmen Transfered")
            : const Text("Something went wrong")));
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
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                ),
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                    onPressed: () {
                      _transferWorkmen(workmens[index], context);
                    },
                    icon: const Icon(
                      Icons.multiple_stop_rounded,
                      size: 20,
                      color: AppTheme.primaryColor,
                    )),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: DropdownButton(
                    menuMaxHeight: 150,
                    value: workmens[index].shift ?? 1,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    onChanged: (double? value) {
                      context
                          .read<AttendanceCubit>()
                          .updateShift(workmens[index], value);
                    },
                    items: const [
                      DropdownMenuItem(
                        child: Text("0"),
                        value: 0.0,
                      ),
                      DropdownMenuItem(
                        child: Text("0.25"),
                        value: 0.25,
                      ),
                      DropdownMenuItem(
                        child: Text("0.5"),
                        value: 0.5,
                      ),
                      DropdownMenuItem(
                        child: Text("1"),
                        value: 1.0,
                      ),
                      DropdownMenuItem(
                        child: Text("1.5"),
                        value: 1.5,
                      ),
                      DropdownMenuItem(
                        child: Text("2"),
                        value: 2.0,
                      ),
                      DropdownMenuItem(
                        child: Text("2.5"),
                        value: 2.5,
                      ),
                      DropdownMenuItem(
                        child: Text("3"),
                        value: 3.0,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0, left: 20),
                  child: Checkbox(
                    activeColor: AppTheme.primaryColor,
                    onChanged: (value) {
                      workmens[index].selected = value;
                      context.read<AttendanceCubit>().updateList(workmens);
                    },
                    value: workmens[index].selected ?? false,
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
