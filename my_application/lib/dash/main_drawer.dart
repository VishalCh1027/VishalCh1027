import 'package:flutter/material.dart';
import 'package:my_application/login_page.dart';
import 'package:my_application/navigator/Profile_Details.dart';
import 'package:my_application/navigator/Projects.dart';
import 'package:my_application/navigator/Purchase.dart';
import '../navigator/Profile_Details.dart';
import '../navigator/Projects.dart';
import '../navigator/attendance.dart';
import '../navigator/selectProject.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer(Key? key,this.projects) : super(key: key);
  final projects;
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
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(''), fit: BoxFit.fill),
                  ),
                ),
                const Text(
                  'Saikiran Kasturi',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'saikiran.kasturi1@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
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
          ExpansionTile(
            leading: const Icon(Icons.person),
            title: const Text(
              'Attendance',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    ListTile(
                     title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                       ElevatedButton(child: Flexible(child: Text(projects[0],style: const TextStyle(color: Colors.black),)),
                       onPressed:(){ 
                          Navigator.push(context,
                           MaterialPageRoute(builder: ((context) =>  Attendance(project: projects[3]))));
                       },
                       style: ElevatedButton.styleFrom(primary: Colors.white,),),
                        Spacer(),
                        ElevatedButton(child: Text(projects[1],style: const TextStyle(color: Colors.black),),
                        onPressed:(){  Navigator.push(context,
                           MaterialPageRoute(builder: ((context) =>  Attendance(project: projects[3]))));
                           },
                        style: ElevatedButton.styleFrom(primary: Colors.white)),
                       ])),
                    ListTile(
                      title: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                       ElevatedButton(child: Flexible( child:Text(projects[2],style: const TextStyle(color: Colors.black),)),
                       onPressed:(){  Navigator.push(context,
                           MaterialPageRoute(builder: ((context) =>  Attendance(project: projects[3]))));
                           },
                       style: ElevatedButton.styleFrom(primary: Colors.white)),
                        Spacer(),
                        ElevatedButton(child: Text("More",style: const TextStyle(color: Colors.black),),
                        onPressed:(){ 
                          Navigator.push(context,
                           MaterialPageRoute(builder: ((context) =>  SelectProject(projects: projects))));
                         },
                        style: ElevatedButton.styleFrom(primary: Colors.white)),
                 ]))
                  ]
                )
              )
            ]
              ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
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
            leading: const Icon(Icons.person),
            title: const Text(
              'Purchase',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Purchase())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_back),
            title: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => LoginPage(key: key))));
            },
          ),
        ],
      ),
    );
  }
}
