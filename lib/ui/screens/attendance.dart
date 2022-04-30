import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_application/constatnts.dart';
import 'package:my_application/models/workmen_model.dart';

import '../../models/attendance_model.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key, required this.project});

  final project;

  @override
  State<StatefulWidget> createState() => _AttendanceState(project);
}

class _AttendanceState extends State<AttendancePage> {
  _AttendanceState(this.project);
  final String project;

  var projects = ["test project", "new project"];
  TimeOfDay inTime = const TimeOfDay(hour: 9, minute: 30);
  TimeOfDay outTime = const TimeOfDay(hour: 6, minute: 30);
  var workmens = List<Attendance>.from([
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 18,
        "bankId": 205,
        "businessId": 3,
        "departmentId": 1,
        "firstName": "shruti",
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
      "workmenId": 18,
      "projectId": 60,
      "overTime": 0,
    },
    {
      "date": "4/26/2022",
      "in": "",
      "out": "",
      "workmen": {
        "id": 19,
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
      "workmenId": 19,
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
        "firstName": "test",
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
        "firstName": "test123",
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
        "firstName": "test123",
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
    }
  ].map((e) => Attendance.fromJson(e)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // ignore: unnecessary_null_comparison
      body: workmens == null
          ? const Center(
              child: Text("Attendance Done"),
            )
          : SingleChildScrollView(
              child: Column(children: <Widget>[
              Card(
                child: ListTile(
                  title: const Text("Name"),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: TextButton(
                        child: const Text("in time",
                            style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextButton(
                        child: const Text("hrs",
                            style: TextStyle(color: Colors.black)),
                        onPressed: () {},
                      ),
                    ),
                  ]),
                ),
              ),
              _buildlist(),
              _buildButton()
            ])),
    );
  }

  Widget _buildButton() {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.all(0.0),
          child: Text("Submit"),
        ),
        onPressed: () {
          var check = workmens.any((element) => element.selected == true);
          if (!check) {
            var snackBar = SnackBar(content: Text("select workmens"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {}
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
      ),
    );
  }

  Widget _buildHead() {
    return ListTile(title: Center(child: Text(project)));
  }

  Widget _buildlist() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: workmens.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              tileColor: (() {
                if (workmens[index].selected!) {
                  return Colors.green[100];
                }

                return null;
              }()),
              onTap: () {
                setState(() {
                  workmens[index].selected = !workmens[index].selected!;
                });
              },
              title: Text(workmens[index].workmen!.firstname),
              subtitle: Row(mainAxisSize: MainAxisSize.min, children: [
                InkWell(
                  child: Text("Transfer",
                      style: TextStyle(color: Colors.cyanAccent[700])),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: const Text('Select Project'),
                              content: _buildTransfPage());
                        });
                  },
                ),
              ]),
              // subtitle: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Text("in time : " +
              //         (workmen.in_?.format(context) ??
              //             inTime.format(context)) +
              //         " "),
              //     InkWell(
              //       child: const Text(
              //         "change",
              //         style: TextStyle(color: Colors.blue),
              //       ),
              //       onTap: () {
              //         _selectInTime(context, workmen);
              //       },
              //     )
              //   ],
              // ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: TextButton(
                    child: Text(
                        workmens[index].in_?.format(context) ??
                            inTime.format(context),
                        style: TextStyle(color: Colors.cyanAccent[700])),
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
                          setState(() {
                            workmens[index].selected = true;
                            workmens[index].hoursWorked = value;
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            child: Text("4"),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("6"),
                            value: 6,
                          ),
                          DropdownMenuItem(
                            child: Text("8"),
                            value: 8,
                          ),
                          DropdownMenuItem(
                            child: Text("10"),
                            value: 10,
                          ),
                          DropdownMenuItem(
                            child: Text("12"),
                            value: 12,
                          ),
                          DropdownMenuItem(
                            child: Text("16"),
                            value: 16,
                          )
                        ]))
              ]),
            ),
          );
        });
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
                                AttendancePage(project: projects[index]))));
                  },
                ));
              }))
    ]));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text("Attendance"),
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
      setState(() {
        var index = workmens
            .indexWhere((element) => element.workmenId == attendance.workmenId);

        workmens[index].in_ = timeOfDay;
        workmens[index].selected = true;
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
      setState(() {
        var index = workmens
            .indexWhere((element) => element.workmenId == attendance.workmenId);
        workmens[index].out = timeOfDay;
        workmens[index].selected = true;
      });
    }
  }
}
