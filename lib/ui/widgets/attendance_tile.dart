import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/ui/screens/project_screens/projectlistscreen.dart';

class AttendanceTileView extends StatefulWidget {
  AttendanceTileView({Key? key});

  @override
  _AttendanceTileView createState() => _AttendanceTileView();
}

class _AttendanceTileView extends State<AttendanceTileView> {
  _AttendanceTileView();
  bool heading = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
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
                    padding: EdgeInsets.only(left: 4, bottom: 0, top: 16),
                    child: Text(
                      'Date',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: -0.1,
                          color: AppTheme.secondaryColor.withOpacity(0.5)),
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
                              style: const TextStyle(
                                fontFamily: AppTheme.fontName,
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: AppTheme.secondaryColor,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8, bottom: 8),
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                letterSpacing: -0.2,
                                color: AppTheme.secondaryColor,
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
                                color: AppTheme.secondaryColor.withOpacity(0.5),
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
                                    color: AppTheme.secondaryColor
                                        .withOpacity(0.5),
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
                                  ),
                                );
                              },
                              child: const Text(
                                'Mark today\'s attendance',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 0.0,
                                  color: AppTheme.secondaryColor,
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
