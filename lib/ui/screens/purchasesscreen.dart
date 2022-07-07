import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/purchases/bloc.dart';
import 'package:my_application/bloc/purchases/service.dart';
import 'package:my_application/bloc/purchases/state.dart';
import 'package:my_application/models/purchaserequest_model.dart';
import 'package:my_application/ui/screens/requestscreen.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({Key? key}) : super(key: key);

  @override
  _PurchasesScreen createState() => _PurchasesScreen();
}

class _PurchasesScreen extends State<PurchasesScreen>
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

  Widget _addAllListData() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                  child: ListTile(
                    dense: true,
                    title: const Text(
                      "Order No",
                      style: AppTheme.listheading,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Center(
                            child: const Text("Priority",
                                style: AppTheme.listheading),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 23),
                          child: Center(
                            child: const Text("Delivery",
                                style: AppTheme.listheading),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Center(
                            child: const Text(
                              "Status",
                              style: AppTheme.listheading,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: Column(children: [PurchaseListVIew()]))
            ],
          ),
        ),
      ),
    );
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: FloatingActionButton(
            backgroundColor: AppTheme.nearlyDarkBlue,
            elevation: 50,
            child: Icon(Icons.add),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>
                          RequestScreen(request: PurchaseRequest()))))
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (_) =>
              PurchasesCubit(repository: context.read<PurchasesService>())
                ..getPurchases(1),
          child: Stack(
            children: <Widget>[
              ListView.builder(
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
                            color:
                                AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: MediaQuery.of(context).size.height - 100,
                        child: Column(
                          children: [
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
                                    "Order No",
                                    style: AppTheme.listheading,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Center(
                                          child: const Text("Priority",
                                              style: AppTheme.listheading),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 23),
                                        child: Center(
                                          child: const Text("Delivery",
                                              style: AppTheme.listheading),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0),
                                        child: Center(
                                          child: const Text(
                                            "Status",
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
              getAppBarUI(),
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
            return RequestScreen(request: currentRequest);
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
                child: purchases[index].selected
                    ? Container(
                        width: 300,
                        height: 40,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: 50,
                              child: TextButton(
                                child: Icon(
                                  Icons.create_rounded,
                                  color: AppTheme.primaryColor,
                                  size: 20,
                                ),
                                onPressed: () {
                                  _openRequest(purchases[index], context);
                                },
                              ),
                            )),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextButton(
                                  child: Icon(
                                    Icons.delete_forever_rounded,
                                    color: AppTheme.primaryColor,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<PurchasesCubit>()
                                        .deletePurchase(purchases[index]);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ))
                    : ListTile(
                        onTap: () {
                          if (purchases
                              .any((element) => element.selected == true)) {
                            context.read<PurchasesCubit>().unSelectAll();
                          } else {
                            _openRequest(purchases[index], context);
                          }
                        },
                        onLongPress: () {
                          context
                              .read<PurchasesCubit>()
                              .editPurchase(purchases[index]);
                        },
                        title: purchases[index].selected
                            ? null
                            : SizedBox(
                                child: Text(
                                  purchases[index]
                                      .orderNo
                                      .toString()
                                      .replaceRange(18, null, ""),
                                  maxLines: 3,
                                ),
                              ),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: SizedBox(
                                width: 50,
                                child: Center(
                                    child: Text(
                                  purchases[index].priority!,
                                ))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text(
                              DateFormat("dd-MM-yyyy")
                                  .format(purchases[index].deliveryAt!),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: purchases[index].status == 0
                                ? Icon(
                                    Icons.change_circle_outlined,
                                    color: Colors.blue,
                                  )
                                : purchases[index].status == 2
                                    ? Icon(
                                        Icons.thumb_up_off_alt_rounded,
                                        color: Colors.green,
                                      )
                                    : purchases[index].status == 3
                                        ? Icon(
                                            Icons.clear_rounded,
                                            color: Colors.red,
                                          )
                                        : Icon(
                                            Icons.back_hand_outlined,
                                            color: Colors.grey,
                                          ),
                          ),
                        ]),
                      ),
              ));
        },
      ),
    );
  }
}
