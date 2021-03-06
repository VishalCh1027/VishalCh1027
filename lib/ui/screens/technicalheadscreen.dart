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

class TechnicalHeadScreen extends StatefulWidget {
  const TechnicalHeadScreen({Key? key}) : super(key: key);

  @override
  _TechnicalHeadScreen createState() => _TechnicalHeadScreen();
}

class _TechnicalHeadScreen extends State<TechnicalHeadScreen>
    with TickerProviderStateMixin {
  double topBarOpacity = 0.0;
  List<String> tabs = ["Requested", "Approved"];
  String currentStatus = "Requested";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          PurchasesCubit(repository: context.read<PurchasesService>())
            ..getTechnicalHeadRequests(1, tabs[0]),
      child: DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              setState(() {
                currentStatus = tabs[tabController.index];
              });
              context.read<PurchasesCubit>().PageChange();
              context
                  .read<PurchasesCubit>()
                  .getTechnicalHeadRequests(1, tabs[tabController.index]);
            }
          });
          return Scaffold(
            drawer: NowDrawer(currentPage: "Technical Approvals"),
            appBar: AppBar(
              backgroundColor: AppTheme.appbarColor,
              iconTheme: IconThemeData(color: Colors.black),
              bottom: TabBar(indicatorColor: AppTheme.secondaryColor, tabs: [
                Tab(
                  child: Text(tabs[0], style: AppTheme.title),
                ),
                Tab(
                  child: Text(tabs[1], style: AppTheme.title),
                ),
              ]),
              title: Expanded(
                child: Text(
                  'Purchase Requests',
                  textAlign: TextAlign.left,
                  style: AppTheme.headline,
                ),
              ),
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
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
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height - 100,
                        child: Column(
                          children: [
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
                                    currentStatus: currentStatus,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
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
      context
          .read<PurchasesCubit>()
          .getTechnicalHeadRequests(1, widget.currentStatus);
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
            state.status == PurchasesStatus.PurchaseInitial) {
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
                                Text(
                                  "Delivery Date : " +
                                      DateFormat("dd-MM-yyyy").format(
                                          state.purchases[index].deliveryAt!),
                                  style: AppTheme.caption,
                                ),
                                Text(
                                  "Priority : " +
                                      state.purchases[index].priority!,
                                  style: AppTheme.caption,
                                ),
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
          return const Center(child: LinearProgressIndicator());
        }
      },
    );
  }
}
