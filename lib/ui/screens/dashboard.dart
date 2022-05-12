import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_application/ui/screens/selectProject.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../constatnts.dart';
import '../widgets/account_icon.dart';
import '../widgets/main_drawer.dart';
import 'attendancescreen.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, this.animationController});
  final AnimationController? animationController;
  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  var projects = [
    "Test project",
    "Worli Project",
    "Mumbai Project",
    "Maharashtra Area",
    "Lower parel chawl"
  ];
  var _selectedItemPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15.0,
            ),
            Container(
              height: 100,
              width: 350,
              child: Column(children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Requests",
                      style: GoogleFonts.signika(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[700]),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 1,
                ),
                Expanded(
                    child: ListView(
                  itemExtent: 110,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.green),
                                ),
                                elevation: 3,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      top: 15,
                                    ),
                                    child: Column(children: [
                                      Row(children: [
                                        Text("20",
                                            style: GoogleFonts.signika(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 25,
                                                color: textColor))
                                      ]),
                                      Row(children: [
                                        Text(
                                          "Approved",
                                          style: GoogleFonts.signika(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.green),
                                        )
                                      ]),
                                    ]))))),
                    Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 15,
                                ),
                                child: Column(children: [
                                  Row(children: [
                                    Text("10",
                                        style: GoogleFonts.signika(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25,
                                            color: textColor)),
                                  ]),
                                  Row(children: [
                                    Text("Rejected",
                                        style: GoogleFonts.signika(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.red,
                                        )),
                                  ])
                                ])))),
                    Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 15,
                                ),
                                child: Column(children: [
                                  Row(children: [
                                    Text("15",
                                        style: GoogleFonts.signika(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25,
                                            color: textColor))
                                  ]),
                                  Row(children: [
                                    Text(
                                      "Hold",
                                      style: GoogleFonts.signika(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.grey[600]),
                                    )
                                  ]),
                                ])))),
                  ],
                ))
              ]),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color.fromRGBO(97, 99, 119, 1),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
                height: 120,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(15), right: Radius.circular(15)),
                ),
                child: Column(children: [
                  Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Attendance",
                        style: GoogleFonts.signika(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.grey[700]),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 1,
                  ),
                  Expanded(
                    child: ListView(
                      itemExtent: 80,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => AttendanceScreen(
                                          project: projects[0]))));
                            },
                            child: Container(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        12), // if you need this
                                  ),
                                  elevation: 3,
                                  color: Colors.white,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8, top: 6, right: 8),
                                      child: Text(
                                        projects[0],
                                        style: GoogleFonts.signika(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                            color: textColor),
                                      ))),
                            )),
                        Container(
                            child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => AttendanceScreen(
                                        project: projects[0]))));
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // if you need this
                              ),
                              elevation: 3,
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, top: 6, right: 8),
                                  child: Text(
                                    projects[1],
                                    style: GoogleFonts.signika(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: textColor),
                                  ))),
                        )),
                        InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => AttendanceScreen(
                                          project: projects[0]))));
                            },
                            child: Container(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        12), // if you need this
                                  ),
                                  elevation: 3,
                                  color: Colors.white,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8, top: 6, right: 8),
                                      child: Text(
                                        projects[2],
                                        style: GoogleFonts.signika(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                            color: textColor),
                                      ))),
                            )),
                        InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => AttendanceScreen(
                                          project: projects[0]))));
                            },
                            child: Container(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        12), // if you need this
                                  ),
                                  elevation: 3,
                                  color: Colors.white,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8, top: 6, right: 8),
                                      child: Text(
                                        projects[3],
                                        style: GoogleFonts.signika(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                            color: textColor),
                                      ))),
                            )),
                      ],
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      child: Padding(
                          padding:
                              EdgeInsets.only(left: 295, top: 6, bottom: 10),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => SelectProject(
                                              projects: projects,
                                            ))));
                              },
                              child: Text("More",
                                  style: GoogleFonts.signika(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Colors.blue)))),
                    )
                  ])
                ])),
          ],
        ),
      ),
    );
  }
}
