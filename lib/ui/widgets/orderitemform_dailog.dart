import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:my_application/models/orderItem_model.dart';

import '../../app_theme.dart';

class OrderItemUpdatePage extends StatefulWidget {
  OrderItemUpdatePage({Key? key, this.orderItem});
  final OrderItem? orderItem;
  @override
  State<OrderItemUpdatePage> createState() => _OrderItemUpdatePage(orderItem);
}

class _OrderItemUpdatePage extends State<OrderItemUpdatePage> {
  _OrderItemUpdatePage(this.orderItem);

  final OrderItem? orderItem;
  bool _canSave = false;
  OrderItem _item = OrderItem.empty();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void initState() {
    _item = orderItem ?? OrderItem.empty();

    super.initState();
  }

  void _setCanSave(bool save) {
    if (save != _canSave) setState(() => _canSave = save);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
        backgroundColor: AppTheme.white,
        appBar: new AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  FontAwesomeIcons.xmark,
                  color: AppTheme.nearlyBlack,
                )),
            title: const Text('Add New Item',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w700,
                  fontSize: 22 + 6 - 6,
                  letterSpacing: 1.2,
                  color: AppTheme.darkerText,
                )),
            actions: <Widget>[
              new TextButton(
                  child: new Text(
                    'ADD',
                    style: TextStyle(color: AppTheme.nearlyDarkBlue),
                  ),
                  onPressed: () {
                    checkForm();
                    if (_canSave) {
                      Navigator.of(context).pop(_item);
                    }
                  })
            ]),
        body: Center(
            child: Container(
          width: 350,
          child: Form(
              key: formKey,
              child: Column(children: [
                TextFormField(
                  initialValue: _item.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _item.name = value;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: AppTheme.nearlyDarkBlue,
                      )),
                ),
                TextFormField(
                  initialValue: _item.description,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _item.description = value;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        color: AppTheme.nearlyDarkBlue,
                      )),
                ),
                DropdownButtonFormField(
                    elevation: 2,
                    value: _item.unit,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select unit';
                      }
                      return null;
                    },
                    items: Unit.values.map((item) {
                      return new DropdownMenuItem<String>(
                        value: item.toString(),
                        child: new Text(
                          item.name,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _item.unit =
                            value.toString().replaceFirst(RegExp("Unit."), "");
                      });
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          FontAwesomeIcons.ruler,
                          color: Colors.blue,
                        ),
                        labelText: "Unit",
                        labelStyle: TextStyle(color: AppTheme.nearlyDarkBlue))),
                TextFormField(
                  initialValue:
                      _item.quantity != null ? _item.quantity.toString() : null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Quantity';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]+[.]{0,1}[0-9]*')),
                  ],
                  onChanged: (value) {
                    _item.quantity = double.tryParse(value);
                  },
                  decoration: const InputDecoration(
                      icon: Icon(
                        FontAwesomeIcons.arrowUpWideShort,
                        color: Colors.blue,
                      ),
                      labelText: 'Quantity',
                      labelStyle: TextStyle(
                        color: AppTheme.nearlyDarkBlue,
                      )),
                ),
              ])),
        )));
  }

  void checkForm() {
    this.setState(() {
      _setCanSave(formKey.currentState!.validate());
    });
  }
}
