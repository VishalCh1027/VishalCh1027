import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/Wallet/bloc.dart';
import 'package:my_application/bloc/Wallet/service.dart';
import 'package:my_application/bloc/Wallet/state.dart';
import 'package:my_application/models/wallet_model.dart';
import 'package:my_application/models/wallettransactions_model.dart';
import 'package:my_application/ui/widgets/add_expense.dart';
import 'package:my_application/ui/widgets/bottom_loader.dart';
import 'package:my_application/ui/widgets/drawer.dart';
import 'package:my_application/ui/widgets/title_view.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreen createState() => _WalletScreen();
}

class _WalletScreen extends State<WalletScreen> with TickerProviderStateMixin {
  Wallet? wallet;
  @override
  void initState() {
    getWallet();

    super.initState();
  }

  Future<double?> getWallet() async {
    wallet = await context.read<WalletService>().getWallet(1);
    return wallet?.balance;
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NowDrawer(currentPage: "Wallet"),
      appBar: AppBar(
        backgroundColor: AppTheme.background,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Wallet',
          textAlign: TextAlign.left,
          style: AppTheme.headline,
        ),
      ),
      backgroundColor: AppTheme.primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.2),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      "Total Balance",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppTheme.primaryColor
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FutureBuilder(
                                      builder: (ctx, snapshot) {
                                        // Checking if future is resolved or not
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          // If we got an error
                                          if (snapshot.hasError) {
                                            return Center(
                                              child: Text(
                                                '${snapshot.error} occurred',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            );

                                            // if we got our data
                                          } else if (snapshot.hasData) {
                                            // Extracting data from snapshot object
                                            final data = snapshot.data;
                                            return Text(
                                                '₹' + (data?.toString() ?? "0"),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                  color: AppTheme.primaryColor
                                                      .withOpacity(0.8),
                                                ));
                                          }
                                        }

                                        // Displaying LoadingSpinner to indicate waiting state
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      future: getWallet(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: AppTheme.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              "Add Expense",
                              style: TextStyle(color: AppTheme.secondaryColor),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => AddExpensePage(
                                        expense: WalletTransaction(),
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocProvider(
              create: (_) =>
                  WalletCubit(repository: context.read<WalletService>())
                    ..getTransactions(1),
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 8, bottom: 18),
                      child: TitleView(
                        titleTxt: "Payment Transactions",
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: WalletListVIew(),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WalletListVIew extends StatefulWidget {
  const WalletListVIew({Key? key}) : super(key: key);

  @override
  State<WalletListVIew> createState() => _buildlist();
}

class _buildlist extends State<WalletListVIew> {
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
    if (_isBottom) context.read<WalletCubit>().getTransactions(1);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == TransactionStatus.TransactionError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status ==
                TransactionStatus.TransactionLoadedSuccessfully ||
            state.status == TransactionStatus.TransactionInitial) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.hasReachedMax
                ? state.transactions.length
                : state.transactions.length + 1,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return index >= state.transactions.length
                  ? BottomLoader()
                  : Container(
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            state.transactions[index].description ?? "NA",
                            maxLines: 3,
                            style: AppTheme.body1,
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
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        (state.transactions[index].type ==
                                                    "Credit"
                                                ? "+"
                                                : "-") +
                                            (state.transactions[index].amount
                                                .toString()),
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
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
                                "Date : " +
                                    DateFormat("dd-MM-yyyy").format(
                                        state.transactions[index].date!),
                                style: AppTheme.caption,
                              ),
                              Text(
                                "Payment Type : " +
                                    state.transactions[index].paymentType!,
                                style: AppTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
            },
          );
        } else if (state.status == TransactionStatus.listIsEmty) {
          return const Center(child: Text('List is empty'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
