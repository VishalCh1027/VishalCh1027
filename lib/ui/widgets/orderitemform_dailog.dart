import 'package:flutter/material.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/models/orderItem_model.dart';

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.clear_rounded,
            color: AppTheme.nearlyBlack,
          ),
        ),
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
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.background,
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.secondaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
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
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppTheme.secondaryColor,
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: AppTheme.secondaryColor,
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: _item.description,
                      onChanged: (value) {
                        _item.description = value;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.info_outline_rounded,
                          color: AppTheme.secondaryColor,
                        ),
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          color: AppTheme.secondaryColor,
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
                            prefixIcon: Icon(
                              Icons.linear_scale_rounded,
                              color: AppTheme.secondaryColor,
                            ),
                            labelText: "Unit",
                            labelStyle:
                                TextStyle(color: AppTheme.secondaryColor))),
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
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _item.quantity = double.tryParse(value);
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.production_quantity_limits_rounded,
                          color: AppTheme.secondaryColor,
                        ),
                        labelText: 'Quantity',
                        labelStyle: TextStyle(
                          color: AppTheme.secondaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppTheme.secondaryColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                checkForm();
                                if (_canSave) {
                                  Navigator.of(context).pop(_item);
                                }
                              },
                              child: const SizedBox(
                                width: 300,
                                height: 25,
                                child: Center(
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
