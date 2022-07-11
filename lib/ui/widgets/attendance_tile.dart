import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/ui/screens/projectlistscreen.dart';

class AttendanceTileView extends StatefulWidget {
  AttendanceTileView({Key? key});

  @override
  _AttendanceTileView createState() => _AttendanceTileView();
}

class _AttendanceTileView extends State<AttendanceTileView> {
  _AttendanceTileView();
  late Timer timer;
  bool heading = true;
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        heading = !heading;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 8, top: 16),
                    child: Text(
                      'Have you marked your workers attendance today',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: -0.1,
                          color: heading ? AppTheme.grey : Colors.red),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 8, top: 16),
                    child: Text(
                      'Date',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: -0.1,
                          color: AppTheme.darkText),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 4, bottom: 3),
                            child: Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(DateTime.now())
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTheme.fontName,
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 8),
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                letterSpacing: -0.2,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: AppTheme.grey.withOpacity(0.5),
                                size: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  'Today 8:26 AM',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    color: AppTheme.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 14),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<Object>(
                                      builder: (BuildContext context) {
                                        return ProjectListScreen(
                                          officeId: currentOffice.id ?? 0,
                                          type: PageType.MarkAttendance,
                                        );
                                      },
                                      fullscreenDialog: true),
                                );
                              },
                              child: Text(
                                'Mark today\'s attendance',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 0.0,
                                  color: AppTheme.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 24, right: 24, top: 8, bottom: 16),
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             Text(
            //               '185 cm',
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontFamily: AppTheme.fontName,
            //                 fontWeight: FontWeight.w500,
            //                 fontSize: 16,
            //                 letterSpacing: -0.2,
            //                 color: AppTheme.darkText,
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(top: 6),
            //               child: Text(
            //                 'Height',
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontFamily: AppTheme.fontName,
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 12,
            //                   color: AppTheme.grey.withOpacity(0.5),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Expanded(
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: <Widget>[
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: <Widget>[
            //                 Text(
            //                   '27.3 BMI',
            //                   textAlign: TextAlign.center,
            //                   style: TextStyle(
            //                     fontFamily: AppTheme.fontName,
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 16,
            //                     letterSpacing: -0.2,
            //                     color: AppTheme.darkText,
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 6),
            //                   child: Text(
            //                     'Overweight',
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       fontFamily: AppTheme.fontName,
            //                       fontWeight: FontWeight.w600,
            //                       fontSize: 12,
            //                       color: AppTheme.grey.withOpacity(0.5),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //       Expanded(
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: <Widget>[
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: <Widget>[
            //                 Text(
            //                   '20%',
            //                   style: TextStyle(
            //                     fontFamily: AppTheme.fontName,
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 16,
            //                     letterSpacing: -0.2,
            //                     color: AppTheme.darkText,
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 6),
            //                   child: Text(
            //                     'Body fat',
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       fontFamily: AppTheme.fontName,
            //                       fontWeight: FontWeight.w600,
            //                       fontSize: 12,
            //                       color: AppTheme.grey.withOpacity(0.5),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // )
            // ,
          ],
        ),
      ),
    );
  }
}