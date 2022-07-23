import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/models/purchaserequest_model.dart';
import 'package:my_application/models/orderItem_model.dart';
import 'package:my_application/common/priority_enum.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/ui/widgets/orderitemform_dailog.dart';

enum RequestPageType { requests, technicalrequests, viewOnly }

class RequestScreen extends StatefulWidget {
  RequestScreen({Key? key, this.request, required this.type});

  final RequestPageType type;

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
  var isViewOnly = false;

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

    if (request.deliveryAt != null) {
      deliveryDate.text =
          request.deliveryAt.toString().replaceRange(11, null, "");
    }

    if (widget.type == RequestPageType.viewOnly) {
      isViewOnly = true;
    }
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

  Widget _buildorderitemlist() {
    var orderItems = request.orderItems;
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppTheme.background))),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: ListTile(
              onTap: () {
                if (widget.type == RequestPageType.requests) {
                  if (isdelete) {
                    setState(() {
                      orderItems[index].selected = !orderItems[index].selected;

                      if (!orderItems
                          .any((element) => element.selected == true)) {
                        isdelete = false;
                      }
                    });
                  } else {
                    _openDialogAddItem(orderItems[index]);
                  }
                }
              },
              leading: isdelete
                  ? Icon(
                      orderItems[index].selected
                          ? Icons.check
                          : Icons.check_box_outline_blank_rounded,
                      color: AppTheme.secondaryColor,
                      size: 20,
                    )
                  : null,
              title: Text(
                orderItems[index].name!,
                style: AppTheme.body1,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 26),
                    child: SizedBox(
                      width: 60,
                      child: Center(
                        child: Text(
                          orderItems[index].quantity.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.body1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: SizedBox(
                      width: 50,
                      child: Center(
                        child: Text(
                          orderItems[index].unit.toString(),
                          style: AppTheme.body1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onLongPress: () {
                if (widget.type == RequestPageType.requests) {
                  setState(
                    () {
                      isdelete = true;
                      orderItems[index].selected = true;
                    },
                  );
                }
              },
            ),
          ),
        );
      },
    ));
  }

  Future<void> _deliverydatebuild(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: request.deliveryAt ?? now,
        firstDate: DateTime(1101),
        lastDate: DateTime(2101));
    if (picked != null && picked != request.deliveryAt) {
      setState(() {
        request.deliveryAt = picked;
      });
    }
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
                      color: AppTheme.secondaryColor,
                      size: 20,
                    ),
                    onTap: () {
                      setState(
                        () {
                          request.orderItems.removeWhere(
                              (element) => element.selected == true);
                          isdelete = false;
                        },
                      );
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
                      color: AppTheme.secondaryColor,
                      size: 20,
                    ),
                    onTap: () {
                      setState(() {
                        request.orderItems
                            .forEach((element) => element.selected = false);
                        isdelete = false;
                      });
                    },
                  ),
                ),
              ),
            ]),
            leading: InkWell(
              child: Icon(
                Icons.checklist_rounded,
                color: AppTheme.secondaryColor,
                size: 20,
              ),
              onTap: () {
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
              },
            ),
          ),
        ));
  }

  void checkForm() {
    var check = formKey.currentState?.validate() ?? true;
    if (check) {
      if (!request.orderItems.isEmpty) {
        Navigator.of(context).pop(request);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Add items in request")));
      }
    }
  }

  Future openReasonDailog(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Reason"),
            content: TextField(
              decoration: InputDecoration(hintText: "Enter reason here"),
            ),
            actions: [TextButton(onPressed: () {}, child: Text("Save"))],
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppTheme.appbarColor,
        title: const Expanded(
          child: Text(
            'Request Detail',
            textAlign: TextAlign.left,
            style: AppTheme.headline,
          ),
        ),
      ),
      floatingActionButton:
          widget.type == RequestPageType.technicalrequests || isViewOnly
              ? null
              : (isdelete
                  ? null
                  : FloatingActionButton(
                      highlightElevation: 5,
                      backgroundColor: AppTheme.secondaryColor,
                      elevation: 50,
                      child: Icon(Icons.add),
                      onPressed: () => {_openDialogAddItem(null)},
                    )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
                color: AppTheme.primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                    child: isViewOnly ||
                            widget.type == RequestPageType.technicalrequests
                        ? Container(
                            height: 200,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      IconData(0xe044,
                                          fontFamily: 'MaterialIcons'),
                                      color: AppTheme.secondaryColor,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Project",
                                      style: TextStyle(
                                          color: AppTheme.deactivatedText,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Text(
                                      request.project!.name ?? "NA",
                                      style: TextStyle(
                                          color: AppTheme.nearlyBlack,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                              child: const Icon(
                                                Icons.person,
                                                color: AppTheme.secondaryColor,
                                                size: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 115,
                                              child: Text(
                                                "Delivary Date",
                                                style: AppTheme.body2,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 0),
                                              child: Text(
                                                request.deliveryAt
                                                    .toString()
                                                    .replaceRange(11, null, ""),
                                                style: AppTheme.body2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                              child: const Icon(
                                                Icons.person,
                                                color: AppTheme.secondaryColor,
                                                size: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 115,
                                              child: Text(
                                                "Requested By",
                                                style: AppTheme.body2,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 0),
                                              child: Text(
                                                request.priority.toString(),
                                                style: AppTheme.body2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Form(
                            key: formKey,
                            child: Column(
                              children: [
                                DropdownButtonFormField(
                                    elevation: 2,
                                    value: request.projectId != null
                                        ? request.projectId.toString()
                                        : null,
                                    validator: (value) {
                                      if (value == null || value == 0) {
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
                                      setState(() {
                                        request.projectId =
                                            int.tryParse(value as String);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Project",
                                    )),
                                TextFormField(
                                    validator: (value) {
                                      if (value == null || value == "") {
                                        return 'Please select Delivery';
                                      }
                                      return null;
                                    },
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Delivery',
                                    ),
                                    controller: deliveryDate,
                                    onTap: () async {
                                      // Below line stops keyboard from appearing
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      // Show Date Picker Here
                                      await _deliverydatebuild(context);
                                      deliveryDate.text =
                                          DateFormat('yyyy/MM/dd').format(
                                              request.deliveryAt ??
                                                  DateTime.now());
                                      setState(() {});
                                    }),
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
                  ),
                  _buildbuttons(context),
                ],
              ),
            ),
          ),
          const ListTile(
            title: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Request Items", style: AppTheme.title),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppTheme.background,
                            ),
                          ),
                        ),
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
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
                                  padding: EdgeInsets.only(right: 40),
                                  child: Center(
                                    child: Text(
                                      "Quantity",
                                      style: AppTheme.listheading,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Center(
                                    child: Text("Unit",
                                        style: AppTheme.listheading),
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
                  _buildorderitemlist(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildbuttons(BuildContext context) {
    if (widget.type == RequestPageType.technicalrequests) {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 20),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.secondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  checkForm();
                },
                child: const SizedBox(
                  width: 300,
                  height: 25,
                  child: Center(
                    child: Text(
                      'Approve',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.secondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  openReasonDailog(context);
                },
                child: const SizedBox(
                  width: 300,
                  height: 25,
                  child: Center(
                    child: Text(
                      'Reject',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.secondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  openReasonDailog(context);
                },
                child: const SizedBox(
                  width: 300,
                  height: 25,
                  child: Center(
                    child: Text(
                      'Hold',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (widget.type == RequestPageType.requests) {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 20),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.secondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  checkForm();
                },
                child: const SizedBox(
                  width: 300,
                  height: 25,
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        height: 10,
      );
    }
  }
}
