import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/login/service.dart';
import 'package:my_application/common/roles.dart';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/login_page.dart';
import 'package:my_application/ui/widgets/drawer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<Widget> listViews = <Widget>[];

  var user = currentLogin.employee;
  @override
  void initState() {
    addAllListData();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addAllListData() {
    listViews.add(
      Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 10),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.logoColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppTheme.grey.withOpacity(0.2),
                  offset: const Offset(1.1, 1.1),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6, left: 16, right: 16, bottom: 16),
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Container(
                          child: Icon(
                            Icons.account_circle,
                            color: AppTheme.secondaryColor,
                            size: 70,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text(
                                user!.firstName! + " " + user!.lastName!,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  letterSpacing: 0.27,
                                  color: AppTheme.secondaryColor,
                                ),
                              ),
                              Text(
                                user!.email ?? "",
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  letterSpacing: 0.27,
                                  color: AppTheme.secondaryColor,
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppTheme.grey.withOpacity(0.07),
                            offset: const Offset(0, 0.5),
                            spreadRadius: 3,
                            blurRadius: 10)
                      ],
                      color: AppTheme.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(54),
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Project Supervisor at",
                            style: AppTheme.title,
                          ),
                        ),
                        Center(
                            child: Text(
                          user?.business?.name ?? "",
                          style: AppTheme.title,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    listViews.add(
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppTheme.secondaryColor.withOpacity(0.2)))),
                child: const OptionsTile(
                  title: Text(
                    "Select Office",
                    style: AppTheme.title,
                  ),
                  leadingIcon: Icon(
                    Icons.store,
                    size: 30,
                    color: AppTheme.secondaryColor,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: AppTheme.secondaryColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppTheme.secondaryColor.withOpacity(0.1)))),
                child: const OptionsTile(
                  title: Text(
                    "Settings",
                    style: AppTheme.title,
                  ),
                  leadingIcon: Icon(
                    Icons.settings,
                    size: 30,
                    color: AppTheme.secondaryColor,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: AppTheme.secondaryColor,
                  ),
                ),
              ),
              OptionsTile(
                title: const Text(
                  "Logout",
                  style: AppTheme.title,
                ),
                leadingIcon: Icon(
                  Icons.logout,
                  size: 30,
                  color: AppTheme.secondaryColor,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: AppTheme.secondaryColor,
                ),
                onTap: () {
                  context.read<LoginService>().logOut();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (b) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
    listViews.add(
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppTheme.secondaryColor.withOpacity(0.1)))),
                child: const OptionsTile(
                  title: Text(
                    "About Us",
                    style: AppTheme.title,
                  ),
                  leadingIcon: Icon(
                    Icons.info,
                    size: 30,
                    color: AppTheme.secondaryColor,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: AppTheme.secondaryColor,
                  ),
                ),
              ),
              const OptionsTile(
                title: Text(
                  "More",
                  style: AppTheme.title,
                ),
                leadingIcon: Icon(
                  Icons.file_open_rounded,
                  size: 30,
                  color: AppTheme.secondaryColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ],
          ),
        ),
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
    return Scaffold(
      drawer: NowDrawer(currentPage: "Account"),
      appBar: AppBar(
        backgroundColor: AppTheme.appbarColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Image.asset(
          'assets/alyn logo.png',
          fit: BoxFit.contain,
          height: 40,
        ),
      ),
      body: Stack(
        children: <Widget>[
          getMainListViewUI(),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
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
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      child: ListTile(
        leading: leadingIcon,
        title: Padding(padding: const EdgeInsets.only(left: 8.0), child: title),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
