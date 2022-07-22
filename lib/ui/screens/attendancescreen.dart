import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/attendance/bloc.dart';
import 'package:my_application/bloc/attendance/state.dart';
import 'package:my_application/bloc/workmen_list/service.dart';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/models/attendance_model.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/ui/screens/project_screens/projectlistscreen.dart';
import 'package:my_application/ui/widgets/bottom_loader.dart';
import 'package:my_application/ui/widgets/switch.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key, required this.project}) : super(key: key);
  final Project project;
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  Animation<double>? topBarAnimation;
  double topBarOpacity = 0.0;

  bool selectAll = false;

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
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Builder(builder: (context) {
                  return _buildHead(context);
                }),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Card(
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
                                    ),
                                  ),
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
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: AttendanceListVIew(
                            onchange: (value) {
                              setState(() {
                                selectAll = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )

                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHead(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: AppTheme.secondaryColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
            topRight: Radius.circular(15.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppTheme.grey.withOpacity(0.2),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                Text(
                  "Project",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppTheme.primaryColor.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 1, right: 15),
              child: Text(
                widget.project.name ?? "NA",
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  letterSpacing: 1.2,
                  color: AppTheme.background,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                Text(
                  "Date",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppTheme.primaryColor.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 1),
              child: Text(
                DateFormat("dd-MM-yyyy").format(DateTime.now()),
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  letterSpacing: 1.2,
                  color: AppTheme.background,
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 20),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Text(
                      "Select All",
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontSize: 17,
                        color: AppTheme.background,
                      ),
                    ),
                    SizedBox(width: 10),
                    SwitchControl(
                        activeColor: Colors.green,
                        value: selectAll,
                        onChanged: (value) {
                          setState(() {
                            selectAll = value;
                          });
                          context.read<AttendanceCubit>().selectAll(value);
                        }),
                  ],
                ),
              )),
        ]),
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

class AttendanceListVIew extends StatefulWidget {
  const AttendanceListVIew({Key? key, required this.onchange})
      : super(key: key);

  final Function(bool) onchange;
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
    if (_isBottom)
      context.read<AttendanceCubit>().getWorkmens(
            1,
          );
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
            return ListView.builder(
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
                            trailing:
                                Row(mainAxisSize: MainAxisSize.min, children: [
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
                                  value: state.attendance[index].shift ?? 1,
                                  style: AppTheme.body1,
                                  onChanged: (double? value) {
                                    context.read<AttendanceCubit>().updateShift(
                                        state.attendance[index], value);
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
                                padding:
                                    const EdgeInsets.only(right: 0, left: 20),
                                child: SwitchControl(
                                  activeColor: AppTheme.secondaryColor,
                                  width: 45,
                                  height: 25,
                                  onChanged: (value) {
                                    state.attendance[index].selected = value;
                                    context
                                        .read<AttendanceCubit>()
                                        .updateList(state.attendance);
                                    widget.onchange(!state.attendance.any(
                                        (element) =>
                                            element.selected == false));
                                  },
                                  value:
                                      state.attendance[index].selected ?? false,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
