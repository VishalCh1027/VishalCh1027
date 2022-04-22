import 'package:flutter/material.dart';
import 'package:my_application/dash/dashboard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dash/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            const Text('Welcome',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30,
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
              height: 30,
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
              height: 30,
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
                      MaterialPageRoute(builder: (context) => Dashboard(formKey)),
                    );
                  }
                } else {
                  Alert(context: context,
                            title: "Login Failed",
                            desc: "invalid Attempt.").show();
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
    );
  }
}
