import 'package:flutter/material.dart';
import 'package:my_application/constatnts.dart';

class Details extends StatefulWidget {
  const Details({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _Details createState() => _Details();
}

class _Details extends State<Details> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Details',
            style: pageTitle,
          ),
          centerTitle: true,
          backgroundColor: kCaptionColor,
        ),
      );
}
