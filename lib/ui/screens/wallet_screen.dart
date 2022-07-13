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
import 'package:my_application/ui/widgets/drawer.dart';

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
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        drawer: NowDrawer(currentPage: "Wallet"),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Wallet',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: AppTheme.fontName,
              fontWeight: FontWeight.w700,
              fontSize: 20 + 6,
              letterSpacing: 1.2,
              color: AppTheme.darkerText,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.white,
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
                                                  color: AppTheme.primaryColor,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w900),
                                            );
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
                            child: Text("Add Expense"),
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
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppTheme.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
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
                                          "All",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        onPressed: () {
                                          context
                                              .read<WalletCubit>()
                                              .getTransactions(1);
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
                                          "Expenses",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        onPressed: () {
                                          context
                                              .read<WalletCubit>()
                                              .getTransactions(1);
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
                                          "Credits",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        onPressed: () {
                                          context
                                              .read<WalletCubit>()
                                              .getTransactions(1);
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
                                        "Payment Transactions",
                                        style: AppTheme.listheading,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Column(children: [WalletListVIew()]))
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
          ]),
        ),
      ),
    );
  }
}

class WalletListVIew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == TransactionStatus.TransactionError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status ==
            TransactionStatus.TransactionLoadedSuccessfully) {
          return _buildlist(transactions: state.transactions);
        } else if (state.status == TransactionStatus.TransactionEditing) {
          return _buildlist(transactions: state.transactions);
        } else if (state.status == TransactionStatus.listIsEmty) {
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
    required this.transactions,
  }) : super(key: key);

  List<WalletTransaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              child: ListTile(
                onTap: () {},
                title: SizedBox(
                  child: Text(
                    transactions[index].description ?? "NA",
                    maxLines: 3,
                    style: TextStyle(fontWeight: FontWeight.w400),
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
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              (transactions[index].type == "Credit"
                                      ? "+"
                                      : "-") +
                                  (transactions[index].amount.toString()),
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
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
                    Text("Date : " +
                        DateFormat("dd-MM-yyyy")
                            .format(transactions[index].date!)),
                    Text("Payment Type : " + transactions[index].paymentType!),
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
