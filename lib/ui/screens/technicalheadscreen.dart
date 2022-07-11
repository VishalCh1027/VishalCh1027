import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/purchases/bloc.dart';
import 'package:my_application/bloc/purchases/service.dart';
import 'package:my_application/bloc/purchases/state.dart';
import 'package:my_application/global/global_function.dart';
import 'package:my_application/models/purchaserequest_model.dart';
import 'package:my_application/ui/screens/requestscreen.dart';

enum PurchaseStatus {
  All,
  Requested,
  Approved,
  Rejected,
  Hold,
  Closed,
}

class TechnicalHeadScreen extends StatefulWidget {
  const TechnicalHeadScreen({Key? key}) : super(key: key);

  @override
  _TechnicalHeadScreen createState() => _TechnicalHeadScreen();
}

class _TechnicalHeadScreen extends State<TechnicalHeadScreen>
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
                'Purchase Requests',
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
          create: (_) =>
              PurchasesCubit(repository: context.read<PurchasesService>())
                ..getPurchases(
                    1, GetEnumValue(PurchaseStatus.Requested.toString())),
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
                      padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height - 100,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      maximumSize: Size(200, 50),
                                      minimumSize: Size(200, 50),
                                      primary: AppTheme.primaryColor,
                                      backgroundColor: AppTheme.background,
                                    ),
                                    child: Text(
                                      "Requested",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<PurchasesCubit>()
                                          .getPurchases(1, "Requested");
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      maximumSize: Size(200, 50),
                                      minimumSize: Size(200, 50),
                                      primary: AppTheme.primaryColor,
                                      backgroundColor: AppTheme.background,
                                    ),
                                    child: Text(
                                      "Approved",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<PurchasesCubit>()
                                          .getPurchases(1, "Approved");
                                    },
                                  ),
                                ),
                              ],
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
                                    "Order Details",
                                    style: AppTheme.listheading,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Center(
                                          child: Text(
                                            "Employee Name",
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
                                child: Column(children: [PurchaseListVIew()]))
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
                          'Purchase Requests',
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

class PurchaseListVIew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchasesCubit, PurchasesState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == PurchasesStatus.PurchasesError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status ==
            PurchasesStatus.PurchasesLoadedSuccessfully) {
          return _buildlist(purchases: state.purchases);
        } else if (state.status == PurchasesStatus.PurchasesEditing) {
          return _buildlist(purchases: state.purchases);
        } else if (state.status == PurchasesStatus.listIsEmty) {
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
    required this.purchases,
  }) : super(key: key);

  List<PurchaseRequest> purchases;

  Future _openRequest(
      PurchaseRequest currentRequest, BuildContext context) async {
    context.read<PurchasesCubit>().unSelectAll();
    purchases;
    PurchaseRequest? request = await Navigator.of(context).push(
      MaterialPageRoute<PurchaseRequest>(
          builder: (BuildContext context) {
            return RequestScreen(
              request: currentRequest,
              type: currentRequest.status != "Approved"
                  ? RequestPageType.technicalrequests
                  : RequestPageType.viewOnly,
            );
          },
          fullscreenDialog: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: purchases.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: purchases[index].selected
                  ? Color.fromARGB(255, 248, 248, 250)
                  : null,
              child: ListTile(
                onTap: () {
                  if (purchases.any((element) => element.selected == true)) {
                    context.read<PurchasesCubit>().unSelectAll();
                  } else {
                    _openRequest(purchases[index], context);
                  }
                },
                onLongPress: () {
                  context.read<PurchasesCubit>().editPurchase(purchases[index]);
                },
                title: SizedBox(
                  child: Text(
                    purchases[index]
                        .orderNo
                        .toString()
                        .replaceRange(18, null, ""),
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
                              (purchases[index].employee!.firstName! +
                                  " " +
                                  purchases[index].employee!.lastName!),
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
                    Text("Delivery Date : " +
                        DateFormat("dd-MM-yyyy")
                            .format(purchases[index].deliveryAt!)),
                    Text("Priority : " + purchases[index].priority!),
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