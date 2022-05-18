import 'package:flutter/material.dart';
import 'package:my_application/Apptheme/constatnts.dart';

class AccountIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              IconData(0xf522, fontFamily: 'MaterialIcons'),
              color: bgColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
