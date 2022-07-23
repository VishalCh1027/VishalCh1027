import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_application/apptheme/app_theme.dart';

import 'package:my_application/ui/screens/purchasesscreen.dart';

class RequetsView extends StatelessWidget {
  const RequetsView({Key? key, this.Action}) : super(key: key);
  final Function()? Action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, top: 16, bottom: 18),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 4),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: AppTheme.grey.withOpacity(0.2),
                                      offset: const Offset(1.1, 1.1),
                                      blurRadius: 2.0),
                                ],
                                color: AppTheme.primaryColor,
                                border: Border.all(
                                  color: AppTheme.background.withOpacity(0.4),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Icon(
                                            FontAwesomeIcons.solidThumbsUp,
                                            color: AppTheme.logoColor,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child: Text(
                                            '${(1127 * 1).toInt()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              color: AppTheme.secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 10),
                                    child: Text(
                                      'Approved',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: AppTheme.secondaryColor
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            color: AppTheme.secondaryColor
                                                .withOpacity(0.1)),
                                      ),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (b) => PurchasesScreen(
                                              state: 0,
                                            ),
                                          ),
                                        );
                                      },
                                      trailing: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 20,
                                        color: AppTheme.secondaryColor
                                            .withOpacity(0.5),
                                      ),
                                      dense: true,
                                      title: Text(
                                        "VIEW",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          letterSpacing: -0.1,
                                          color: AppTheme.secondaryColor
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: AppTheme.grey.withOpacity(0.2),
                                      offset: const Offset(1.1, 1.1),
                                      blurRadius: 5),
                                ],
                                color: AppTheme.primaryColor,
                                border: Border.all(
                                  color: AppTheme.background.withOpacity(0.4),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Icon(
                                            FontAwesomeIcons.solidThumbsDown,
                                            color: AppTheme.logoColor,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child: Text(
                                            '${(57 * 1).toInt()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              color: AppTheme.secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 10),
                                    child: Text(
                                      'Rejected',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: AppTheme.secondaryColor
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            color: AppTheme.secondaryColor
                                                .withOpacity(0.3)),
                                      ),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (b) => PurchasesScreen(
                                              state: 2,
                                            ),
                                          ),
                                        );
                                      },
                                      trailing: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 20,
                                        color: AppTheme.secondaryColor
                                            .withOpacity(0.5),
                                      ),
                                      dense: true,
                                      title: Text(
                                        "VIEW",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          letterSpacing: -0.1,
                                          color: AppTheme.secondaryColor
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: AppTheme.grey.withOpacity(0.2),
                                      offset: const Offset(1.1, 1.1),
                                      blurRadius: 5.0),
                                ],
                                color: AppTheme.primaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Icon(
                                            Icons.front_hand,
                                            color: AppTheme.logoColor,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child: Text(
                                            '${(43 * 1).toInt()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              color: AppTheme.secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 10),
                                    child: Text(
                                      'Hold',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: AppTheme.secondaryColor
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          color: AppTheme.secondaryColor
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (b) => PurchasesScreen(
                                              state: 1,
                                            ),
                                          ),
                                        );
                                      },
                                      trailing: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 20,
                                        color: AppTheme.secondaryColor
                                            .withOpacity(0.5),
                                      ),
                                      dense: true,
                                      title: Text(
                                        "VIEW",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          letterSpacing: -0.1,
                                          color: AppTheme.secondaryColor
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
