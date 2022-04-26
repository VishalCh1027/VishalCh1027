import 'package:flutter/material.dart';

class Purchase extends StatelessWidget {
  var items = 0;
  Widget build(BuildContext context) =>
  MaterialApp(
    home: Scaffold(
         appBar: AppBar(
          title: const Text('Purchases'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: const Center(
          child: Text("new item")
          )
          ),
      );
}

MaterialApp purchases()
{
   return MaterialApp(
       home:Scaffold(
         body: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                 Icon(
                   Icons.home,
                   color: Colors.blue,
                   size: 40,
                 ),
                 Text("hdfj"),
                ],
         )
       )
   );
}