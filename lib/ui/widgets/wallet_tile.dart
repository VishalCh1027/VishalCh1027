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
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.secondaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
              topRight: Radius.circular(5.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WalletScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FutureBuilder(
                future: RepositoryProvider.of<WalletService>(context)
                    .getWallet(currentLogin.employee?.id ?? 0),
                builder:
                    (BuildContext context, AsyncSnapshot<Wallet> snapshot) {
                  if (snapshot.hasData) {
                    return ListTile(
                      leading: Icon(
                        FontAwesomeIcons.wallet,
                        color: AppTheme.background,
                      ),
                      title: Text(
                        "Balance",
                        style: TextStyle(
                            color: AppTheme.background,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "₹" + snapshot.data!.balance.toString(),
                        style: TextStyle(
                            color: AppTheme.background,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return CircularProgressIndicator();
                  }
                  return CircularProgressIndicator();
                }),
          ),
        ),
      ),
    );
  }
}
