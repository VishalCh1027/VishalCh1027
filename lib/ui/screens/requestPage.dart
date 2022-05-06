import 'package:flutter/material.dart';
import 'package:my_application/constatnts.dart';

class RequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('New Request'),
          centerTitle: true,
          backgroundColor: bgColor,
          actions: [
            TextButton(
              child: Icon(IconData(0xe156, fontFamily: 'MaterialIcons')),
              onPressed: () {},
            )
          ],
        ),
        body: Container(),
      );
}
