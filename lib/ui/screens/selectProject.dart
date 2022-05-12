import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_application/constatnts.dart';

import 'attendancescreen.dart';

class SelectProject extends StatelessWidget {
  const SelectProject({Key? key, required this.projects}) : super(key: key);

  final projects;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Select Project",
            style: pageTitle,
          ),
          backgroundColor: kCaptionColor,
        ),
        body: ListView.builder(
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
            }));
  }
}
