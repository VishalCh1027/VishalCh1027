import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20),
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
              title: Text(orderItems[index].name!, style: AppTheme.body1),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 26),
                    child: SizedBox(
                      width: 60,
                      child: Center(
                        child: Text(orderItems[index].quantity.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.body1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: SizedBox(
                      width: 50,
                      child: Center(
                        child: Text(orderItems[index].unit.toString(),
                            style: AppTheme.body1),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appbarColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Request Detail',
              textAlign: TextAlign.left,
              style: AppTheme.headline,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  color: AppTheme.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            IconData(0xe044, fontFamily: 'MaterialIcons'),
                            color: AppTheme.secondaryColor,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Project",
                            style: TextStyle(
                                color: AppTheme.deactivatedText, fontSize: 15),
                          ),
                        ],
                      ),
                      ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            billing?.project?.name ?? "NA",
                            style: TextStyle(
                                color: AppTheme.nearlyBlack, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
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
                                    "Vendor",
                                    style: AppTheme.body2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Text(
                                    billing?.vendor?.name.toString() ?? "NA",
                                    style: AppTheme.body2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
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
                                    (billing!.employee?.firstName ?? "NA")
                                        .toString(),
                                    style: AppTheme.body2,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                                      FontAwesomeIcons.moneyBill,
                                      color: AppTheme.secondaryColor,
                                      size: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 115,
                                    child: Text(
                                      "Total Amount",
                                      style: AppTheme.body2,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Text(
                                      "₹" + billing!.amount.toString(),
                                      style: AppTheme.body2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: _buildbuttons(context),
                      ),
                    ],
                  ),
                ),
              )),
          const ListTile(
            title: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "billing Items",
                style: AppTheme.title,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
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
                        child: Text("Unit", style: AppTheme.listheading),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: _buildorderitemlist(),
          ),
        ],
      ),
    );
  }

  Widget _buildbuttons(BuildContext context) {
    if (widget.type == billingPageType.proqurementApproval) {
      return Row(
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
              onPressed: () async {},
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
              onPressed: () async {},
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
        ],
      );
    } else {
      return Container();
    }
  }
}
