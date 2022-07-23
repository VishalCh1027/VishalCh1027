import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color secondaryColor = Color(0xFF37454F);
  static const Color background = Color(0xFFE2E2E2);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color logoColor = Color(0xFFFFd126);
  static const Color appbarColor = Color(0xFFFFFFFF);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);

  static const Color darkText = Color(0xFF37454F);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFFFAFAFA);
  static const Color deactivatedText = Color(0xFF566B7A);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Roboto';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 17,
    letterSpacing: 0.18,
    color: darkText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body2Light = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.2,
    color: deactivatedText,
  );

  static const TextStyle body1 = TextStyle(
      fontFamily: fontName,
      letterSpacing: .3,
      fontSize: 15,
      fontWeight: FontWeight.w200,
      color: darkText);

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: deactivatedText, // was lightText
  );
  static const TextStyle listheading = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    letterSpacing: 0.2,
    color: darkText, // was lightText
  );
}
