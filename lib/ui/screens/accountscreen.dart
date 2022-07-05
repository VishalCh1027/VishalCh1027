import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/login/event.dart';
import 'package:my_application/bloc/login/service.dart';
import 'package:my_application/global/global_variables.dart';
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
      Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: ListTile(
          leading: ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                center: Alignment.topLeft,
                radius: 1.5,
                colors: <Color>[
                  AppTheme.nearlyDarkBlue,
                  HexColor('#6A88E5'),
                ],
                tileMode: TileMode.repeated,
              ).createShader(bounds);
            },
            child: Icon(
              Icons.account_circle_rounded,
              size: 50,
              color: AppTheme.white,
            ),
          ),
          title: Text(
            currentLogin.employee!.firstName! +
                " " +
                currentLogin.employee!.lastName!,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 10,
          ),
        ),
      ),
    );
    listViews.add(
      ListTile(
        leading: Icon(
          Icons.store,
          size: 30,
        ),
        title: Text(
          "Select Office",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 10,
        ),
      ),
    );
    listViews.add(
      ListTile(
        leading: Icon(
          Icons.settings,
          size: 30,
        ),
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 10,
        ),
      ),
    );
    listViews.add(
      ListTile(
        onTap: () {
          Navigator.of(context).pop();
          context.read<LoginService>().logOut();
        },
        leading: Icon(
          Icons.logout,
          size: 30,
        ),
        title: Text(
          "Logout",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 10,
        ),
      ),
    );

    listViews.add(
      ListTile(),
    );

    listViews.add(
      ListTile(),
    );
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
