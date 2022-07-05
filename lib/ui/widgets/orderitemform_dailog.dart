import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_application/models/orderItem_model.dart';

import '../../Apptheme/app_theme.dart';

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
      backgroundColor: AppTheme.background,
      appBar: new AppBar(
        toolbarHeight: 80,
        backgroundColor: AppTheme.background,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.clear_rounded,
              color: AppTheme.nearlyBlack,
            )),
        title: const Text(
          'Request Item',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: AppTheme.fontName,
            fontWeight: FontWeight.w700,
            fontSize: 22 + 6 - 6,
            letterSpacing: 1.2,
            color: AppTheme.darkerText,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                  color: AppTheme.nearlyDarkBlue,
                  icon:
                      const Icon(IconData(0xe156, fontFamily: 'MaterialIcons')),
                  onPressed: () {
                    checkForm();
                    if (_canSave) {
                      Navigator.of(context).pop(_item);
                    }
                  }))
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.white,
          ),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height - 100,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
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
                          color: AppTheme.nearlyDarkBlue,
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: AppTheme.nearlyDarkBlue,
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: _item.description,
                      onChanged: (value) {
                        _item.description = value;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.info_outline_rounded,
                          color: AppTheme.nearlyDarkBlue,
                        ),
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          color: AppTheme.nearlyDarkBlue,
                        ),
                      ),
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
                            value: item.name.toString(),
                            child: new Text(
                              item.name.toString(),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _item.unit = value
                                .toString()
                                .replaceFirst(RegExp("Unit."), "");
                          });
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.linear_scale_rounded,
                              color: AppTheme.nearlyDarkBlue,
                            ),
                            labelText: "Unit",
                            labelStyle:
                                TextStyle(color: AppTheme.nearlyDarkBlue))),
                    TextFormField(
                      initialValue: _item.quantity != null
                          ? _item.quantity.toString()
                          : null,
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
                          Icons.production_quantity_limits_rounded,
                          color: AppTheme.nearlyDarkBlue,
                        ),
                        labelText: 'Quantity',
                        labelStyle: TextStyle(
                          color: AppTheme.nearlyDarkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkForm() {
    this.setState(() {
      _setCanSave(formKey.currentState!.validate());
    });
  }
}
