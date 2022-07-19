import 'package:flutter/material.dart';
import 'package:my_application/apptheme/app_theme.dart';

class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final bool istrailing;
  final Function()? trailingAction;

  const TitleView(
      {Key? key,
      this.titleTxt = "",
      this.subTxt = "",
      this.istrailing = true,
      this.trailingAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                titleTxt,
                textAlign: TextAlign.left,
                style: AppTheme.title,
              ),
            ),
            istrailing
                ? InkWell(
                    highlightColor: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    onTap: trailingAction,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(subTxt,
                              textAlign: TextAlign.left, style: AppTheme.body1),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: 18,
                  ),
          ],
        ),
      ),
    );
  }
}
