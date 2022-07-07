import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/login/service.dart';
import 'package:my_application/common/roles.dart';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/login_page.dart';
import 'package:my_application/main.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<Widget> listViews = <Widget>[];

  @override
  void initState() {
    addAllListData();

    super.initState();
  }

  void addAllListData() {
    listViews.add(
      Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: ListTile(
            leading: ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.5,
                  colors: <Color>[
                    AppTheme.primaryColor,
                    HexColor('#6A88E5'),
                  ],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.account_circle_rounded,
                size: 50,
                color: AppTheme.white,
              ),
            ),
            title: Text(
              currentLogin.employee!.firstName! +
                  " " +
                  currentLogin.employee!.lastName!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 10,
            ),
          ),
        ),
      ),
    );
    listViews.add(
      const OptionsTile(
        title: Text(
          "Select Office",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leadingIcon: Icons.store,
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 10,
        ),
      ),
    );
    listViews.add(
      const OptionsTile(
        title: const Text(
          "Wallet",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leadingIcon: Icons.account_balance_wallet,
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 10,
        ),
      ),
    );

    listViews.add(
      const OptionsTile(
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leadingIcon: Icons.settings,
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 10,
        ),
      ),
    );

    listViews.add(
      OptionsTile(
        title: const Text(
          "Logout",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leadingIcon: Icons.logout,
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 10,
        ),
        onTap: () {
          context.read<LoginService>().logOut();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (b) => LoginPage()));
        },
      ),
    );

    if (claims.any((e) => e.value == BusinessClaims.wallet)) {
      listViews.add(
        const ListTile(),
      );
    }
  }

  Widget getMainListViewUI() {
    return ListView.builder(
      itemCount: listViews.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return listViews[index];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppTheme.background,
        child: Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              getMainListViewUI(),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ));
  }
}

class OptionsTile extends StatelessWidget {
  const OptionsTile(
      {Key? key,
      required this.title,
      required this.leadingIcon,
      this.trailing,
      this.onTap})
      : super(key: key);
  final title;
  final leadingIcon;
  final trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            leadingIcon,
            size: 30,
            color: AppTheme.primaryColor,
          ),
        ),
        title: Padding(padding: const EdgeInsets.only(left: 10), child: title),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
