import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/Wallet/service.dart';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/models/wallet_model.dart';
import 'package:my_application/ui/screens/wallet_screen.dart';

class WalletTileView extends StatefulWidget {
  WalletTileView({Key? key});
  @override
  _WalletTileView createState() => _WalletTileView();
}

class _WalletTileView extends State<WalletTileView> {
  _WalletTileView();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, top: 16, bottom: 18),
      child: Card(
        color: AppTheme.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WalletScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
                      child: Icon(
                        FontAwesomeIcons.wallet,
                        color: AppTheme.logoColor,
                      )),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Balance",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppTheme.primaryColor.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          FutureBuilder<Wallet>(
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
                                  final Wallet? data = snapshot.data;
                                  return Text(
                                      '₹' + (data?.balance.toString() ?? "0"),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: AppTheme.primaryColor,
                                      ));
                                }
                              }

                              // Displaying LoadingSpinner to indicate waiting state
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            future:
                                RepositoryProvider.of<WalletService>(context)
                                    .getWallet(currentLogin.employee?.id ?? 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0, top: 10, bottom: 10),
                    child: Icon(
                      Icons.chevron_right,
                      color: AppTheme.background,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
