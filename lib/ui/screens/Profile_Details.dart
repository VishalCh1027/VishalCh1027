import 'package:flutter/material.dart';
import 'package:my_application/Apptheme/constatnts.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

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
