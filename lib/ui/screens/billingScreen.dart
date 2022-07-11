import 'package:flutter/material.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/models/billing_model.dart';

enum billingPageType { payment, proqurementApproval, viewOnly }

class BillingScreen extends StatefulWidget {
  BillingScreen({Key? key, this.billing, required this.type});

  final billingPageType type;

  final Billing? billing;
  @override
  _BillingScreen createState() => _BillingScreen(billing);
}

class _BillingScreen extends State<BillingScreen>
    with TickerProviderStateMixin {
  _BillingScreen(this.billing);

  Billing? billing;
  Animation<double>? topBarAnimation;
  var isViewOnly = false;

  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  var isdelete = false;
  void initState() {
    billing = billing ?? Billing();

    if (widget.type == billingPageType.viewOnly) {
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
    var orderItems = billing?.orderItems ?? [];
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: ListTile(
              onTap: () {},
              leading: isdelete
                  ? Icon(
                      orderItems[index].selected
                          ? Icons.check
                          : Icons.check_box_outline_blank_rounded,
                      color: AppTheme.primaryColor,
                      size: 20,
                    )
                  : null,
              title: Text(orderItems[index].name!),
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onLongPress: () {},
            ),
          ),
        );
      },
    ));
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
                      color: AppTheme.primaryColor,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 1),
                child: Center(
                  child: InkWell(
                    child: Icon(
                      Icons.clear_rounded,
                      color: AppTheme.primaryColor,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ]),
            leading: InkWell(
              child: Icon(
                Icons.checklist_rounded,
                color: AppTheme.primaryColor,
                size: 20,
              ),
              onTap: () {},
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppTheme.background,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Request Detail',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  letterSpacing: 1.2,
                  color: AppTheme.darkerText,
                ),
              ),
            ),
          ),
          actions: [
            Container(
              child: IconButton(
                color: Colors.red,
                onPressed: () => Navigator.of(context).pop(billing),
                icon: const Icon(Icons.close_rounded),
              ),
            ),
            IconButton(
              color: Colors.lightGreenAccent[700],
              onPressed: () => Navigator.of(context).pop(billing),
              icon: const Icon(IconData(0xe156, fontFamily: 'MaterialIcons')),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconData(0xe044,
                                        fontFamily: 'MaterialIcons'),
                                    color: AppTheme.deactivatedText,
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
                                    billing?.project?.name ?? "NA",
                                    style: TextStyle(
                                        color: AppTheme.nearlyBlack,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.av_timer,
                                                color: AppTheme.deactivatedText,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Vendor",
                                                style: TextStyle(
                                                    color: AppTheme
                                                        .deactivatedText,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  billing?.vendor?.name
                                                          .toString() ??
                                                      "NA",
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.nearlyBlack,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.av_timer,
                                                  color:
                                                      AppTheme.deactivatedText,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Requested by",
                                                  style: TextStyle(
                                                      color: AppTheme
                                                          .deactivatedText,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    billing!.employee
                                                            ?.firstName ??
                                                        "NA".toString(),
                                                    style: TextStyle(
                                                        color: AppTheme
                                                            .nearlyBlack,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.av_timer,
                                              color: AppTheme.deactivatedText,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Amount",
                                              style: TextStyle(
                                                  color:
                                                      AppTheme.deactivatedText,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                billing!.amount.toString(),
                                                style: TextStyle(
                                                    color: AppTheme.nearlyBlack,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      const ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "billing Items",
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
                        height: MediaQuery.of(context).size.height / 1.8,
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }
}