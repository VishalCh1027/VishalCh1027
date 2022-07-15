import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/purchases/bloc.dart';
import 'package:my_application/bloc/purchases/service.dart';
import 'package:my_application/bloc/purchases/state.dart';
import 'package:my_application/global/global_function.dart';
import 'package:my_application/models/purchaserequest_model.dart';
import 'package:my_application/ui/screens/purchasesscreen.dart';
import 'package:my_application/ui/screens/requestscreen.dart';
import 'package:my_application/ui/widgets/bottom_loader.dart';
import 'package:my_application/ui/widgets/drawer.dart';

class TechnicalHeadScreen extends StatefulWidget {
  const TechnicalHeadScreen({Key? key}) : super(key: key);

  @override
  _TechnicalHeadScreen createState() => _TechnicalHeadScreen();
}

class _TechnicalHeadScreen extends State<TechnicalHeadScreen>
    with TickerProviderStateMixin {
  double topBarOpacity = 0.0;
  PurchaseStatus status = PurchaseStatus.Requested;

  @override
  void initState() {
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
        drawer: NowDrawer(currentPage: "Technical Approvals"),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Expanded(
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
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (_) =>
              PurchasesCubit(repository: context.read<PurchasesService>())
                ..getTechnicalHeadRequests(1, GetEnumValue(status.toString())),
          child: Stack(
            children: <Widget>[
              ListView.builder(
                padding: EdgeInsets.only(),
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
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
                              color: AppTheme.secondaryColor,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        maximumSize: Size(200, 50),
                                        minimumSize: Size(200, 50),
                                        primary: AppTheme.primaryColor,
                                      ),
                                      child: Text(
                                        "Requested",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          status = PurchaseStatus.Approved;
                                        });
                                        context
                                            .read<PurchasesCubit>()
                                            .PageChange();
                                        context
                                            .read<PurchasesCubit>()
                                            .getTechnicalHeadRequests(
                                                1, "Requested");
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
                                      ),
                                      child: Text(
                                        "Approved",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          status = PurchaseStatus.Approved;
                                        });
                                        context
                                            .read<PurchasesCubit>()
                                            .PageChange();
                                        context
                                            .read<PurchasesCubit>()
                                            .getTechnicalHeadRequests(
                                                1, "Approved");
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
                                          color: AppTheme.background))),
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
                              child: Column(
                                children: [
                                  PurchaseListVIew(
                                    currentStatus: status,
                                  )
                                ],
                              ),
                            )
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
}

class PurchaseListVIew extends StatefulWidget {
  final PurchaseStatus currentStatus;

  const PurchaseListVIew({Key? key, required this.currentStatus})
      : super(key: key);

  @override
  State<PurchaseListVIew> createState() => _buildlist();
}

class _buildlist extends State<PurchaseListVIew> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom)
      context
          .read<PurchasesCubit>()
          .getPurchases(1, GetEnumValue(widget.currentStatus.toString()));
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future _openRequest(
      PurchaseRequest currentRequest, BuildContext context) async {
    context.read<PurchasesCubit>().unSelectAll();
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
    return BlocBuilder<PurchasesCubit, PurchasesState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == PurchasesStatus.PurchasesError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status ==
                PurchasesStatus.PurchasesLoadedSuccessfully ||
            state.status == PurchasesStatus.PurchasesEditing ||
            state.status == PurchasesStatus.Purchaseinitial) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: state.hasReachedMax ||
                      state.status != PurchasesStatus.Purchaseinitial
                  ? state.purchases.length
                  : state.purchases.length + 1,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return index >= state.purchases.length
                    ? BottomLoader()
                    : Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xFFEEEEEE)))),
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          color: state.purchases[index].selected
                              ? Color.fromARGB(255, 248, 248, 250)
                              : null,
                          child: ListTile(
                            onTap: () {
                              if (state.purchases
                                  .any((element) => element.selected == true)) {
                                context.read<PurchasesCubit>().unSelectAll();
                              } else {
                                _openRequest(state.purchases[index], context);
                              }
                            },
                            onLongPress: () {
                              context
                                  .read<PurchasesCubit>()
                                  .editPurchase(state.purchases[index]);
                            },
                            title: SizedBox(
                              child: Text(
                                state.purchases[index].orderNo
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
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Center(
                                        child: Text(
                                          (state.purchases[index].employee!
                                                  .firstName! +
                                              " " +
                                              state.purchases[index].employee!
                                                  .lastName!),
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
                                    DateFormat("dd-MM-yyyy").format(
                                        state.purchases[index].deliveryAt!)),
                                Text("Priority : " +
                                    state.purchases[index].priority!),
                              ],
                            ),
                          ),
                        ),
                      );
              },
            ),
          );
        } else if (state.status == PurchasesStatus.listIsEmty) {
          return const Center(child: Text('List is empty'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
