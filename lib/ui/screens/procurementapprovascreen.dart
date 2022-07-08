import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/billings/bloc.dart';
import 'package:my_application/bloc/billings/service.dart';
import 'package:my_application/bloc/billings/state.dart';
import 'package:my_application/global/global_function.dart';
import 'package:my_application/models/billing_model.dart';

enum Billingtatus {
  All,
  Requested,
  Approved,
  Rejected,
  Hold,
  Closed,
}

class ProcurementHeadScreen extends StatefulWidget {
  const ProcurementHeadScreen({Key? key}) : super(key: key);

  @override
  _ProcurementHeadScreen createState() => _ProcurementHeadScreen();
}

class _ProcurementHeadScreen extends State<ProcurementHeadScreen>
    with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    scrollController.addListener(
      () {
        if (scrollController.offset >= 24) {
          if (topBarOpacity != 1.0) {
            setState(
              () {
                topBarOpacity = 1.0;
              },
            );
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
            setState(
              () {
                topBarOpacity = 0.0;
              },
            );
          }
        }
      },
    );
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        appBar: AppBar(
          title: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Billing Requests',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w700,
                  fontSize: 20 + 6 - 6 * topBarOpacity,
                  letterSpacing: 1.2,
                  color: AppTheme.darkerText,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (_) => BillingCubit(
              repository: context.read<BillingService>())
            ..getBilling(1, GetEnumValue(Billingtatus.Requested.toString())),
          child: Stack(
            children: <Widget>[
              ListView.builder(
                padding: EdgeInsets.only(),
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color:
                                AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height - 100,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 25,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: AppTheme.dark_grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          )),
                                      child: Text(
                                        "Requested",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      onPressed: () {
                                        context.read<BillingCubit>().getBilling(
                                            1,
                                            GetEnumValue(Billingtatus.Requested
                                                .toString()));
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: AppTheme.dark_grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          )),
                                      child: Text(
                                        "Approved",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      onPressed: () {
                                        context.read<BillingCubit>().getBilling(
                                            1,
                                            GetEnumValue(Billingtatus.Approved
                                                .toString()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xFFEEEEEE)))),
                              child: Card(
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                                child: ListTile(
                                  dense: true,
                                  title: const Text(
                                    "Project Name",
                                    style: AppTheme.listheading,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Center(
                                          child: Text(
                                            "Amount",
                                            style: AppTheme.listheading,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Column(children: [BillingListVIew()]))
                          ],
                        ),
                      ),
                    ),
                  );
                },
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

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        Container(
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
                    top: 16 - 8.0 * topBarOpacity,
                    bottom: 12 - 8.0 * topBarOpacity),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Billing Requests',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w700,
                            fontSize: 20 + 6 - 6 * topBarOpacity,
                            letterSpacing: 1.2,
                            color: AppTheme.darkerText,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 38,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32.0)),
                        onTap: () {},
                        child: Center(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.filter_alt,
                              color: AppTheme.grey,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class BillingListVIew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingCubit, BillingState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == BillingStatus.BillingError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status == BillingStatus.BillingLoadedSuccessfully) {
          return _buildlist(billing: state.billing);
        } else if (state.status == BillingStatus.BillingEditing) {
          return _buildlist(billing: state.billing);
        } else if (state.status == BillingStatus.listIsEmty) {
          return const Center(child: Text('List is empty'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _buildlist extends StatelessWidget {
  _buildlist({
    Key? key,
    required this.billing,
  }) : super(key: key);

  List<Billing> billing;

  Future _openRequest(Billing currentRequest, BuildContext context) async {
    // Billing? request = await Navigator.of(context).push(
    //   MaterialPageRoute<Billing>(
    //       builder: (BuildContext context) {
    //         return RequestScreen(
    //           request: currentRequest,
    //           type: currentRequest.status != "Approved"
    //               ? RequestPageType.technicalrequests
    //               : RequestPageType.viewOnly,
    //         );
    //       },
    //       fullscreenDialog: true),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: billing.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              child: ListTile(
                onTap: () {
                  _openRequest(billing[index], context);
                },
                title: SizedBox(
                  child: Text(
                    billing[index].project!.name ?? "NA",
                    maxLines: 3,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Center(
                            child: Text(
                              billing[index].amount.toString(),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Employee : " +
                        billing[index].employee!.firstName! +
                        " " +
                        billing[index].employee!.lastName!),
                    Text("Vendor : " + billing[index].vendor!.name),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
