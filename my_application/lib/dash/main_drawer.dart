import 'package:flutter/material.dart';
import 'package:my_application/navigator/Profile_Details.dart';
import 'package:my_application/navigator/Projects.dart';
import '../navigator/Profile_Details.dart';
import '../navigator/Projects.dart';
import '../navigator/Attendance.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(''), fit: BoxFit.fill),
                  ),
                ),
                Text(
                  'Saikiran Kasturi',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'saikiran.kasturi1@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Details())));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Attendance',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Attendance())));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Project',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Projects())));
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
