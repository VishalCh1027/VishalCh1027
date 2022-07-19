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
import 'package:my_application/ui/widgets/bottom_loader.dart';

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
            backgroundColor: AppTheme.primaryColor,
            iconTheme: const IconThemeData(color: Colors.black),
            toolbarHeight: 80,
            title: const Expanded(
              child: Text(
                "Attendance",
                textAlign: TextAlign.left,
                style: AppTheme.headline,
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
            style: AppTheme.title,
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

class AttendanceListVIew extends StatefulWidget {
  @override
  State<AttendanceListVIew> createState() => _buildlist();
}

class _buildlist extends State<AttendanceListVIew> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

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

    if (result == true) {}
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: result == true
            ? const Text("Workmen Transfered")
            : const Text("Something went wrong")));
  }

  void _onScroll() {
    if (_isBottom) context.read<AttendanceCubit>().getWorkmens(1);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
        buildWhen: (previous, current) => true,
        builder: (context, state) {
          if (state.status == AttendanceStatus.AttendanceError) {
            return const Center(child: Text('Oops something went wrong!'));
          } else if (state.status == AttendanceStatus.AttendanceLoaded ||
              state.status == AttendanceStatus.AttendanceEdited) {
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: state.hasReachedMax
                    ? state.attendance.length
                    : state.attendance.length + 1,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return index >= state.attendance.length
                      ? BottomLoader()
                      : Card(
                          child: Container(
                            child: ListTile(
                              onTap: () {},
                              title: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: Text(
                                  state.attendance[index].workmen!.firstname,
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _transferWorkmen(
                                              state.attendance[index], context);
                                        },
                                        icon: const Icon(
                                          Icons.multiple_stop_rounded,
                                          size: 20,
                                          color: AppTheme.secondaryColor,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: DropdownButton(
                                        menuMaxHeight: 150,
                                        value:
                                            state.attendance[index].shift ?? 1,
                                        style: AppTheme.body1,
                                        onChanged: (double? value) {
                                          context
                                              .read<AttendanceCubit>()
                                              .updateShift(
                                                  state.attendance[index],
                                                  value);
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
                                      padding: const EdgeInsets.only(
                                          right: 0, left: 20),
                                      child: Checkbox(
                                        activeColor: AppTheme.secondaryColor,
                                        onChanged: (value) {
                                          state.attendance[index].selected =
                                              value;
                                          context
                                              .read<AttendanceCubit>()
                                              .updateList(state.attendance);
                                        },
                                        value:
                                            state.attendance[index].selected ??
                                                false,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
