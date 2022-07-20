import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/billings/bloc.dart';
import 'package:my_application/bloc/billings/service.dart';
import 'package:my_application/bloc/billings/state.dart';
import 'package:my_application/models/billing_model.dart';
import 'package:my_application/ui/screens/billingScreen.dart';
import 'package:my_application/ui/widgets/bottom_loader.dart';
import 'package:my_application/ui/widgets/drawer.dart';

class ProcurementHeadScreen extends StatefulWidget {
  const ProcurementHeadScreen({Key? key}) : super(key: key);

  @override
  _ProcurementHeadScreen createState() => _ProcurementHeadScreen();
}

class _ProcurementHeadScreen extends State<ProcurementHeadScreen>
    with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  List<String> tabs = ["Requested", "Approved"];
  String currentStatus = "Requested";
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
      create: (_) => BillingCubit(repository: context.read<BillingService>())
        ..getProcurementApprovals(1, tabs[0]),
      child: DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              setState(() {
                currentStatus = tabs[tabController.index];
              });
              context.read<BillingCubit>().PageChange();
              context
                  .read<BillingCubit>()
                  .getProcurementApprovals(1, tabs[tabController.index]);
            }
          });
          return Container(
            color: AppTheme.background,
            child: Scaffold(
              drawer: NowDrawer(
                currentPage: "Procurement Approvals",
              ),
              appBar: AppBar(
                backgroundColor: AppTheme.background,
                iconTheme: IconThemeData(color: AppTheme.secondaryColor),
                bottom: TabBar(indicatorColor: AppTheme.secondaryColor, tabs: [
                  Tab(
                    child: Text(tabs[0], style: AppTheme.title),
                  ),
                  Tab(
                    child: Text(tabs[1], style: AppTheme.title),
                  ),
                ]),
                title: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Purchase Orders',
                      textAlign: TextAlign.left,
                      style: AppTheme.headline,
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              body: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: AppTheme.secondaryColor
                                .withOpacity(0.4 * topBarOpacity),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppTheme.background,
                        ),
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height - 120,
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
                                    "Project name",
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
                                child: Column(children: [
                              BillingListVIew(
                                currentStatus: currentStatus,
                              )
                            ]))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class BillingListVIew extends StatefulWidget {
  const BillingListVIew({Key? key, required this.currentStatus})
      : super(key: key);
  final String currentStatus;
  @override
  State<BillingListVIew> createState() => _buildlist();
}

class _buildlist extends State<BillingListVIew> {
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
          .read<BillingCubit>()
          .getProcurementApprovals(1, widget.currentStatus);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future _openRequest(Billing currentRequest, BuildContext context) async {
    Billing? bill = await Navigator.of(context).push(
      MaterialPageRoute<Billing>(
          builder: (BuildContext context) {
            return BillingScreen(
              billing: currentRequest,
              type: currentRequest.status != "Approved"
                  ? billingPageType.proqurementApproval
                  : billingPageType.viewOnly,
            );
          },
          fullscreenDialog: true),
    );
    context
        .read<BillingCubit>()
        .getProcurementApprovals(1, widget.currentStatus);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingCubit, BillingState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == BillingStatus.BillingError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status == BillingStatus.BillingLoadedSuccessfully ||
            state.status == BillingStatus.BillingEditing ||
            state.status == BillingStatus.Billinginitial) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              controller: _scrollController,
              itemCount: state.hasReachedMax ||
                      state.status == BillingStatus.Billinginitial
                  ? state.billing.length
                  : state.billing.length + 1,
              itemBuilder: (context, index) {
                return index >= state.billing.length
                    ? BottomLoader()
                    : Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xFFEEEEEE)))),
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          child: ListTile(
                            onTap: () {
                              _openRequest(state.billing[index], context);
                            },
                            title: SizedBox(
                              child: Text(
                                state.billing[index].project!.name ?? "NA",
                                maxLines: 3,
                              ),
                            ),
                            trailing: Text(
                              state.billing[index].amount.toString(),
                              overflow: TextOverflow.visible,
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Requested by : " +
                                    state.billing[index].employee!.firstName! +
                                    " " +
                                    state.billing[index].employee!.lastName!),
                                Text("Vendor : " +
                                    state.billing[index].vendor!.name),
                              ],
                            ),
                          ),
                        ),
                      );
              },
            ),
          );
        } else if (state.status == BillingStatus.listIsEmty) {
          return const Center(child: Text('List is empty'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
