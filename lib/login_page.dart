import 'package:flutter/material.dart';
import 'package:my_application/ui/screens/dashboard.dart';
import 'package:my_application/ui/screens/homepage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'ui/screens/dashboard.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title});

  final String? title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // created global key for form
  //created controller
  TextEditingController usernameCntrlr = TextEditingController();
  TextEditingController passwordCntrlr = TextEditingController();
  String userName = 'test';
  String passWord = '1234567';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen[50],
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        width: 300.0,
        height: 270.0,
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            const Text('Login',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },
              controller: usernameCntrlr, //detects the controller
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.purple,
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter password';
                } else if (value.length < 6) {
                  return 'Please enter password with atleast 6 charaters';
                }
                return null;
              },
              controller: passwordCntrlr, //detects the controller
              obscureText: true,
              //enabled: false,
              //obscuringCharacter: '#',
              // keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.green,
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.purple,
                  )),
            ),
            const SizedBox(
              height: 13,
            ),
            RaisedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (usernameCntrlr.text != userName) {
                    Alert(
                            context: context,
                            title: "Login Failed",
                            desc: "Wrong username.")
                        .show();
                  } else if (passwordCntrlr.text != passWord) {
                    Alert(
                            context: context,
                            title: "Login Failed",
                            desc: "Wrong password.")
                        .show();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                } else {
                  Alert(
                          context: context,
                          title: "Login Failed",
                          desc: "invalid Attempt.")
                      .show();
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            )
          ]),
        ),
      ),
    )));
  }
}
