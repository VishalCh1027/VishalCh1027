import 'package:flutter/material.dart';
import 'package:my_application/constatnts.dart';
import 'package:my_application/models/PurchaseRequest_model.dart';

class Purchase extends StatefulWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  _Purchase createState() => _Purchase();
}

class _Purchase extends State<Purchase> {
  List<PurchaseRequest> requests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Purchase Request",
            style: pageTitle,
          ),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(itemBuilder: ((context, index) {
            return ListTile(
              title: Text(requests[index].orderNO.toString()),
              trailing: Text(requests[index].amount.toString()),
              leading: Text(requests[index].status!),
            );
          })),
        ));
  }
}
