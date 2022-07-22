import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/purchases/bloc.dart';
import 'package:my_application/bloc/purchases/service.dart';
import 'package:my_application/bloc/purchases/state.dart';
import 'package:my_application/models/purchaserequest_model.dart';
import 'package:my_application/ui/screens/requestscreen.dart';
import 'package:my_application/ui/widgets/bottom_loader.dart';
import 'package:my_application/ui/widgets/drawer.dart';

enum PurchaseStatus {
  All,
  Requested,
  Approved,
  Rejected,
  Hold,
  Closed,
}

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({Key? key}) : super(key: key);

  @override
  _PurchasesScreen createState() => _PurchasesScreen();
}

class _PurchasesScreen extends State<PurchasesScreen>
    with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  String currentStatus = "Requested";
  List<String> tabs = [
    "Requested",
    "Hold",
    "Rejected",
  ];

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
    return BlocProvider(
      create: (_) => PurchasesCubit(
        repository: context.read<PurchasesService>(),
      )..getPurchases(1, tabs[0]),
      child: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
            final TabController tabController =
                DefaultTabController.of(context)!;
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                context
                    .read<PurchasesCubit>()
                    .getPurchases(1, tabs[tabController.index], true);
              }
            });
            return Container(
              color: AppTheme.background,
              child: Scaffold(
                drawer: NowDrawer(currentPage: "Purchase Requests"),
                appBar: AppBar(
                  backgroundColor: AppTheme.primaryColor,
                  iconTheme: IconThemeData(color: Colors.black),
                  bottom:
                      TabBar(indicatorColor: AppTheme.secondaryColor, tabs: [
                    Tab(
                      child: Text(tabs[0], style: AppTheme.title),
                    ),
                    Tab(
                      child: Text(tabs[1], style: AppTheme.title),
                    ),
                    Tab(
                      child: Text(tabs[2], style: AppTheme.title),
                    ),
                  ]),
                  title: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Purchase Requests',
                        textAlign: TextAlign.left,
                        style: AppTheme.headline,
                      ),
                    ),
                  ),
                ),
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, right: 20),
                  child: FloatingActionButton(
                    backgroundColor: AppTheme.secondaryColor,
                    elevation: 50,
                    child: Icon(Icons.add),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => RequestScreen(
                                request: PurchaseRequest(),
                                type: RequestPageType.requests,
                              )),
                        ),
                      ),
                    },
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniEndFloat,
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: <Widget>[
                    ListView.builder(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom,
                      ),
                      itemCount: 1,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: AppTheme.grey
                                      .withOpacity(0.4 * topBarOpacity),
                                  offset: const Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.background,
                              ),
                              width: MediaQuery.of(context).size.width - 20,
                              height: MediaQuery.of(context).size.height - 150,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: AppTheme.secondaryColor),
                                      ),
                                    ),
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: 0,
                                      child: ListTile(
                                        dense: true,
                                        title: Text(
                                          "Order No",
                                          style: AppTheme.listheading,
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Center(
                                                child: Text("Priority",
                                                    style:
                                                        AppTheme.listheading),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 23),
                                              child: Center(
                                                child: Text("Delivery",
                                                    style:
                                                        AppTheme.listheading),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 0),
                                              child: Center(
                                                child: Text(
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
                                    child: Column(
                                      children: [
                                        PurchaseListVIew(
                                          currentStatus: currentStatus,
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
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PurchaseListVIew extends StatefulWidget {
  final String currentStatus;

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
      context.read<PurchasesCubit>().getPurchases(1, widget.currentStatus);
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
                  ? RequestPageType.requests
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
              state.status == PurchasesStatus.PurchaseInitial ||
              state.status == PurchasesStatus.PurchasesEditing) {
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: state.hasReachedMax ||
                        state.status == PurchasesStatus.PurchaseInitial
                    ? state.purchases.length
                    : state.purchases.length + 1,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return index >= state.purchases.length
                      ? BottomLoader()
                      : Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppTheme.background),
                            ),
                          ),
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 0,
                            color: state.purchases[index].selected
                                ? Color(0xFFF8F8FA)
                                : null,
                            child: state.purchases[index].selected
                                ? Container(
                                    width: 300,
                                    height: 48,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                            child: SizedBox(
                                          height: 50,
                                          child: TextButton(
                                            child: Icon(
                                              Icons.create_rounded,
                                              color: AppTheme.secondaryColor,
                                              size: 20,
                                            ),
                                            onPressed: () {
                                              _openRequest(
                                                  state.purchases[index],
                                                  context);
                                            },
                                          ),
                                        )),
                                        Expanded(
                                          child: SizedBox(
                                            height: 50,
                                            child: TextButton(
                                              child: Icon(
                                                Icons.delete_forever_rounded,
                                                color: AppTheme.secondaryColor,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                context
                                                    .read<PurchasesCubit>()
                                                    .deletePurchase(
                                                        state.purchases[index]);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: AppTheme.secondaryColor
                                              .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        if (state.purchases.any((element) =>
                                            element.selected == true)) {
                                          context
                                              .read<PurchasesCubit>()
                                              .unSelectAll();
                                        } else {
                                          _openRequest(
                                              state.purchases[index], context);
                                        }
                                      },
                                      onLongPress: () {
                                        context
                                            .read<PurchasesCubit>()
                                            .editPurchase(
                                                state.purchases[index]);
                                      },
                                      title: state.purchases[index].selected
                                          ? null
                                          : SizedBox(
                                              child: Text(
                                                state.purchases[index].orderNo
                                                    .toString()
                                                    .replaceRange(18, null, ""),
                                                maxLines: 3,
                                                style: AppTheme.body1,
                                              ),
                                            ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: SizedBox(
                                              width: 50,
                                              child: Center(
                                                child: Text(
                                                  state.purchases[index]
                                                      .priority!,
                                                  style: AppTheme.body1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Text(
                                              DateFormat("dd-MM-yyyy").format(
                                                  state.purchases[index]
                                                      .deliveryAt!),
                                              style: AppTheme.body1,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: state.purchases[index]
                                                        .status ==
                                                    "Requested"
                                                ? Icon(
                                                    Icons
                                                        .change_circle_outlined,
                                                    color: Colors.blue,
                                                  )
                                                : state.purchases[index]
                                                            .status ==
                                                        "Approved"
                                                    ? Icon(
                                                        Icons
                                                            .thumb_up_off_alt_rounded,
                                                        color: Colors.green,
                                                      )
                                                    : state.purchases[index]
                                                                .status ==
                                                            "Rejected"
                                                        ? Icon(
                                                            Icons.clear_rounded,
                                                            color: Colors.red,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .back_hand_outlined,
                                                            color: Colors.grey,
                                                          ),
                                          ),
                                        ],
                                      ),
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
        });
  }
}
