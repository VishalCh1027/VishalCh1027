import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:my_application/constatnts.dart';
import 'package:my_application/models/PurchaseRequest_model.dart';
import 'package:my_application/models/orderItem_model.dart';
import 'package:my_application/models/priority_enum.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/ui/screens/requestscreen.dart';
import 'package:my_application/ui/widgets/orderitemform_dailog.dart';

import '../../app_theme.dart';
import '../widgets/title_view.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key, this.request});
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
  AnimationController? animationController;

  var request = PurchaseRequest();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var projects = [
    Project(name: "new project", id: 60),
    Project(name: "Jo Liza project", id: 61),
    Project(name: "bdd chawl project", id: 62)
  ];

  TextEditingController deliveryDate = TextEditingController();

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  var isdelete = false;
  void initState() {
    request = purchaserequest ?? PurchaseRequest();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn),
      ),
    );
    addAllListData();

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
    animationController?.dispose();
    super.dispose();
  }

  void addAllListData() {
    const int count = 2;
    var animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve:
            const Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn)));
    listViews.add(
      AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation.value), 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 0),
                      child: Container(
                        width: 400,
                        height: 200,
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
                                      item.name,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  labelText: "Project",
                                )),
                            _deliverydatebuild(),
                            DropdownButtonFormField(
                              elevation: 2,
                              value: request.priority,
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select unit';
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
                              decoration: InputDecoration(
                                labelText: "Priority",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
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
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 40),
                                          child: Center(
                                            child: const Text(
                                              "Quantity",
                                              style: AppTheme.listheading,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Center(
                                            child: const Text("Unit",
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
                          _buildorderitemlist()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
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
                                  fontFamily: 'MaterialIcons',
                                  matchTextDirection: true)),
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
                              onPressed: () =>
                                  Navigator.of(context).pop(request),
                              icon: const Icon(IconData(0xe156,
                                  fontFamily: 'MaterialIcons')),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
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
              child: getMainListViewUI(),
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
                            animationController?.fling().then<dynamic>((data) {
                              setState(() {
                                orderItems[index].selected =
                                    !orderItems[index].selected;

                                if (!orderItems.any(
                                    (element) => element.selected == true)) {
                                  isdelete = false;
                                }
                              });
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
                          animationController?.fling().then<dynamic>((data) {
                            setState(() {
                              isdelete = true;
                              orderItems[index].selected = true;
                            });
                          });
                        },
                      )));
            }));
  }

  Widget _deliverydatebuild() {
    return DateTimeField(
      initialValue: request.deliveryAt,
      decoration: InputDecoration(
        labelText: "Delivery Date",
      ),
      format: format,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      animationController?.fling().then<dynamic>((data) {
        setState(() {
          if (item != null && !request.orderItems.contains(item)) {
            request.orderItems.add(item);
          }
        });
      });
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
                      animationController?.fling().then<dynamic>(
                        (data) {
                          setState(
                            () {
                              request.orderItems.removeWhere(
                                  (element) => element.selected == true);
                              isdelete = false;
                            },
                          );
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
                      FontAwesomeIcons.xmark,
                      color: AppTheme.nearlyDarkBlue,
                      size: 20,
                    ),
                    onTap: () {
                      animationController?.fling().then<dynamic>(
                        (data) {
                          setState(
                            () {
                              request.orderItems.forEach(
                                  (element) => element.selected = false);
                              isdelete = false;
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ]),
            leading: InkWell(
              child: Icon(
                FontAwesomeIcons.listCheck,
                color: AppTheme.nearlyDarkBlue,
                size: 20,
              ),
              onTap: () {
                animationController?.fling().then<dynamic>(
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
                  },
                );
              },
            ),
          ),
        ));
  }
}