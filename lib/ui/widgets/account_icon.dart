import 'package:flutter/material.dart';
import 'package:my_application/apptheme/app_theme.dart';

class AccountIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.center,
          children: const [
            Icon(
              IconData(0xf522, fontFamily: 'MaterialIcons'),
              color: AppTheme.secondaryColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
