import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_application/models/purchaserequest_model.dart';
import 'package:my_application/models/orderItem_model.dart';
import 'package:my_application/models/priority_enum.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/ui/widgets/orderitemform_dailog.dart';

import '../../Apptheme/app_theme.dart';

class RequestScreen extends StatefulWidget {
  RequestScreen({Key? key, this.request});
  final PurchaseRequest? request;
  @override
  _RequestScreen createState() => _RequestScreen(request);
}

class _RequestScreen extends State<RequestScreen>
    with TickerProviderStateMixin {
  _RequestScreen(this.purchaserequest);

  PurchaseRequest? purchaserequest;
  final format = DateFormat("yyyy-MM-dd");
  Animation<double>? topBarAnimation;

  var request = PurchaseRequest();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var projects = [
    Project(name: "new project", id: 60, status: "New"),
    Project(name: "Jo Liza project", id: 61, status: "Active"),
    Project(name: "bdd chawl project", id: 62, status: "New")
  ];

  TextEditingController deliveryDate = TextEditingController();

  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  var isdelete = false;
  void initState() {
    request = purchaserequest ?? PurchaseRequest();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white.withOpacity(topBarOpacity),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 14 - 8.0 * topBarOpacity,
                bottom: 12 - 8.0 * topBarOpacity),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(IconData(0xe092,
                      fontFamily: 'MaterialIcons', matchTextDirection: true)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Request Detail',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w700,
                        fontSize: 22 + 6 - 6 * topBarOpacity,
                        letterSpacing: 1.2,
                        color: AppTheme.darkerText,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  color: AppTheme.nearlyDarkBlue,
                  onPressed: () => Navigator.of(context).pop(request),
                  icon:
                      const Icon(IconData(0xe156, fontFamily: 'MaterialIcons')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildorderitemlist() {
    var orderItems = request.orderItems;
    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
                  child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      // color:
                      //     orderItems[index].selected ? Colors.grey[200] : null,
                      child: ListTile(
                        onTap: () {
                          if (isdelete) {
                            setState(() {
                              orderItems[index].selected =
                                  !orderItems[index].selected;

                              if (!orderItems
                                  .any((element) => element.selected == true)) {
                                isdelete = false;
                              }
                            });
                          } else {
                            _openDialogAddItem(orderItems[index]);
                          }
                        },
                        leading: isdelete
                            ? Icon(
                                orderItems[index].selected
                                    ? Icons.check
                                    : Icons.check_box_outline_blank_rounded,
                                color: AppTheme.nearlyDarkBlue,
                                size: 20,
                              )
                            : null,
                        title: Text(orderItems[index].name!),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 26),
                              child: SizedBox(
                                width: 60,
                                child: Center(
                                    child: Text(
                                  orderItems[index].quantity.toString(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: SizedBox(
                                width: 50,
                                child: Center(
                                  child: Text(
                                    orderItems[index].unit.toString(),
                                  ),
                                ),
                              )),
                        ]),
                        onLongPress: () {
                          setState(() {
                            isdelete = true;
                            orderItems[index].selected = true;
                          });
                        },
                      )));
            }));
  }

  Future<void> _deliverydatebuild() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      savedeliveryDate(pickedDate);
    }
  }

  void savedeliveryDate(pickedDate) {
    setState(() {
      request.deliveryAt = pickedDate; //set output date to TextField value.
    });
  }

  Future _openDialogAddItem(OrderItem? orderItem) async {
    OrderItem? item =
        await Navigator.of(context).push(new MaterialPageRoute<OrderItem>(
            builder: (BuildContext context) {
              return new OrderItemUpdatePage(orderItem: orderItem);
            },
            fullscreenDialog: true));
    saveOrderItem(item);
  }

  void saveOrderItem(item) {
    setState(() {
      if (item != null && !request.orderItems.contains(item)) {
        request.orderItems.add(item);
      }
    });
  }

  Widget _buildedittile() {
    return Container(
        width: 450,
        child: Card(
          margin: EdgeInsets.zero,
          color: Color.fromARGB(255, 222, 222, 224),
          child: ListTile(
            dense: true,
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Center(
                  child: InkWell(
                    child: Icon(
                      IconData(0xe1b9, fontFamily: 'MaterialIcons'),
                      color: AppTheme.nearlyDarkBlue,
                      size: 20,
                    ),
                    onTap: () {
                      (data) {
                        setState(
                          () {
                            request.orderItems.removeWhere(
                                (element) => element.selected == true);
                            isdelete = false;
                          },
                        );
                      };
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 1),
                child: Center(
                  child: InkWell(
                    child: Icon(
                      Icons.clear_rounded,
                      color: AppTheme.nearlyDarkBlue,
                      size: 20,
                    ),
                    onTap: () {
                      (data) {
                        setState(
                          () {
                            request.orderItems
                                .forEach((element) => element.selected = false);
                            isdelete = false;
                          },
                        );
                      };
                    },
                  ),
                ),
              ),
            ]),
            leading: InkWell(
              child: Icon(
                Icons.checklist_rounded,
                color: AppTheme.nearlyDarkBlue,
                size: 20,
              ),
              onTap: () {
                (data) {
                  setState(
                    () {
                      if (request.orderItems
                          .any((element) => element.selected == false)) {
                        request.orderItems
                            .forEach((element) => element.selected = true);
                      } else {
                        request.orderItems
                            .forEach((element) => element.selected = false);
                      }
                    },
                  );
                };
              },
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        floatingActionButton: isdelete
            ? null
            : FloatingActionButton(
                highlightElevation: 5,
                backgroundColor: AppTheme.nearlyDarkBlue,
                elevation: 50,
                child: Icon(Icons.add),
                onPressed: () => {_openDialogAddItem(null)},
              ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: AppTheme.background,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: ListView.builder(
                  controller: scrollController,
                  padding: EdgeInsets.only(
                    top: AppBar().preferredSize.height +
                        MediaQuery.of(context).padding.top +
                        24,
                    bottom: 62 + MediaQuery.of(context).padding.bottom,
                  ),
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.grey
                                  .withOpacity(0.4 * topBarOpacity),
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 30, 30, 0),
                            child: Column(
                              children: [
                                DropdownButtonFormField(
                                    elevation: 2,
                                    value: request.projectId != null
                                        ? request.projectId.toString()
                                        : null,
                                    validator: (value) {
                                      if (value == 0) {
                                        return 'Please select project';
                                      }
                                      return null;
                                    },
                                    items: projects.map((item) {
                                      return new DropdownMenuItem<String>(
                                        value: item.id.toString(),
                                        child: new Text(
                                          item.name ?? "",
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Project",
                                    )),
                                TextFormField(
                                  initialValue: request.deliveryAt == null
                                      ? null
                                      : request.deliveryAt
                                          .toString()
                                          .replaceRange(11, null, ""),
                                  onTap: () {
                                    _deliverydatebuild();
                                  },
                                  readOnly: true,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select Delivery';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Delivery',
                                  ),
                                ),
                                DropdownButtonFormField(
                                  elevation: 2,
                                  value: request.priority,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select Priority';
                                    }
                                    return null;
                                  },
                                  items: RequestPriority.values.map((item) {
                                    return new DropdownMenuItem<String>(
                                      value: item.name.toString(),
                                      child: new Text(
                                        item.name.toString(),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      request.priority = value
                                          .toString()
                                          .replaceFirst(
                                              RegExp("RequestPriority."), "");
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    labelText: "Priority",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Request Items",
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                  color: AppTheme.lightText,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height - 100,
                            width: MediaQuery.of(context).size.width - 40,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                      ),
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: ListTile(
                                          dense: true,
                                          title: const Text(
                                            "Name",
                                            style: AppTheme.listheading,
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 40),
                                                child: Center(
                                                  child: Text(
                                                    "Quantity",
                                                    style: AppTheme.listheading,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Center(
                                                  child: Text("Unit",
                                                      style:
                                                          AppTheme.listheading),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      child: _buildedittile(),
                                      visible: isdelete,
                                    ),
                                  ],
                                ),
                                _buildorderitemlist()
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }
}
