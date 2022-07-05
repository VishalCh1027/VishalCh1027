import 'package:flutter/material.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/ui/widgets/graphic_widget.dart';

class LoadingDialog {
  static bool _isLoadingDialogShowing = false;

  static showLoadingDialog(BuildContext context,
      {String? text, bool hideOnBackButton = false}) async {
    _isLoadingDialogShowing = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return hideOnBackButton;
            },
            child: AlertDialog(
              elevation: 0,
              backgroundColor: text == null
                  ? Colors.transparent
                  : AppTheme.background.withOpacity(0.9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomDotLoading(
                    primaryColor: AppTheme.nearlyDarkBlue,
                  ),
                  SizedBox(
                    height: text == null ? 0 : 10,
                  ),
                  text == null
                      ? Container()
                      : Text(
                          text.isNotEmpty ? text : 'Processing...',
                          style: AppTheme.title
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                ],
              ),
            ),
          );
        });
  }

  static hideLoadingDialog(BuildContext context, {String? text}) async {
    if (_isLoadingDialogShowing) {
      Navigator.pop(context);
      _isLoadingDialogShowing = false;
    }
  }

  static showMessage(BuildContext context, {String? text}) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppTheme.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: Text(
              text ?? '',
              style: AppTheme.title.copyWith(fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              )
            ],
          );
        });
  }

  static showConfirm(BuildContext context,
      {String? text,
      @required Function? onYes,
      @required Function? onNo}) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppTheme.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: text == null
                ? null
                : Text(
                    text,
                    style: AppTheme.title.copyWith(fontWeight: FontWeight.bold),
                  ),
            actions: <Widget>[
              FlatButton(
                color: AppTheme.nearlyDarkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.pop(context);
                  onNo!();
                },
                child: Text('No'),
              ),
              FlatButton(
                color: AppTheme.nearlyDarkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.pop(context);
                  onYes!();
                },
                child: Text('Yes'),
              )
            ],
          );
        });
  }
}
