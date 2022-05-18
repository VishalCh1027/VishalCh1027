import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.iconData = const IconData(0xf05b1, fontFamily: 'MaterialIcons'),
    this.index = 0,
    this.isSelected = false,
    this.animationController,
  });

  IconData iconData;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      iconData: IconData(0xee33, fontFamily: 'MaterialIcons'),
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      iconData: IconData(0xf05ef, fontFamily: 'MaterialIcons'),
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      iconData: IconData(0xe567, fontFamily: 'MaterialIcons'),
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      iconData: IconData(0xe3dc, fontFamily: 'MaterialIcons'),
      index: 3,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      iconData: IconData(0xe3dc, fontFamily: 'MaterialIcons'),
      index: 4,
      isSelected: false,
      animationController: null,
    ),
  ];
}
