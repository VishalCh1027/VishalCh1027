import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_application/ui/screens/selectProject.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../constatnts.dart';
import '../widgets/account_icon.dart';
import '../widgets/main_drawer.dart';
import 'attendance.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  var projects = ["new ", "Test project", "Mumbai", "ABC", "Maharashtra Area"];
  var _selectedItemPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25.0,
              child: Center(
                  child: Text(
                "Requests",
                style: GoogleFonts.signika(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.grey[700]),
              )),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width / 1.32,
              child: ListView(
                itemExtent: 100,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: Colors.green,
                            width: 1,
                          ),
                        ),
                        elevation: 5,
                        color: Colors.green[200],
                        child: Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Column(children: [
                              Text(
                                "Approved",
                                style: GoogleFonts.signika(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.green[800]),
                              ),
                              Text("20",
                                  style: GoogleFonts.signika(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30,
                                      color: Colors.green[800]
                                      // foreground: Paint()
                                      //   ..style = PaintingStyle.stroke
                                      //   ..strokeWidth = 1.5
                                      //   ..color = Colors.green,
                                      ))
                            ]))),
                  ),
                  Container(
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                        elevation: 5,
                        color: Colors.red[200],
                        child: Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Column(children: [
                              Text(
                                "Rejected",
                                style: GoogleFonts.signika(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red[800]),
                              ),
                              Text("10",
                                  style: GoogleFonts.signika(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30,
                                      color: Colors.red[800]))
                            ]))),
                  ),
                  Container(
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        elevation: 5,
                        color: Colors.grey[200],
                        child: Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Column(children: [
                              Text(
                                "Hold",
                                style: GoogleFonts.signika(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.grey[800]),
                              ),
                              Text("15",
                                  style: GoogleFonts.signika(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30,
                                      color: Colors.grey[800]))
                            ]))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color.fromRGBO(97, 99, 119, 1),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 28),
                child: Text(
                  "Attendance",
                  style: GoogleFonts.signika(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.grey[700]),
                ),
              )
            ]),
            Container(
                height: 120,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(15), right: Radius.circular(15)),
                  color: Colors.lightGreen[50],
                ),
                child: Column(children: [
                  Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 17, top: 8),
                      child: Text(
                        "Projects",
                        style: GoogleFonts.signika(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.grey[500]),
                      ),
                    )
                  ]),
                  Expanded(
                    child: ListView(
                      itemExtent: 80,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          child: Card(
                              elevation: 3,
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, top: 4, right: 8),
                                  child: Text(
                                    "Test Project",
                                    style: GoogleFonts.signika(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: textColor),
                                  ))),
                        ),
                        Container(
                          child: Card(
                              elevation: 3,
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, top: 4, right: 8),
                                  child: Text(
                                    "Worli Project",
                                    style: GoogleFonts.signika(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: textColor),
                                  ))),
                        ),
                        Container(
                          child: Card(
                              elevation: 3,
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, top: 4, right: 8),
                                  child: Text(
                                    "Mumbai Project",
                                    style: GoogleFonts.signika(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: textColor),
                                  ))),
                        ),
                        Container(
                          child: Card(
                              elevation: 3,
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, top: 4, right: 8),
                                  child: Text(
                                    "Lower parel chawl",
                                    style: GoogleFonts.signika(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: textColor),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Padding(
                        padding: EdgeInsets.only(left: 295, top: 6, bottom: 10),
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
                  ])
                ])),
          ],
        ),
      ),
    );
  }
}
