import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_application/app_theme.dart';
import 'package:my_application/main.dart';
import 'package:my_application/ui/screens/dashboard.dart';
import 'package:my_application/ui/screens/forgetpasswordscreen.dart';
import 'package:my_application/ui/screens/home_screen.dart';
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

  var obscure = true;

  String userName = 'test@gmail.com';
  String passWord = '1234567';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 25.0, // soften the shadow
              spreadRadius: 1, //extend the shadow
            )
          ],
          gradient: LinearGradient(
            colors: <HexColor>[
              HexColor("#6899f5"),
              HexColor("#d173bb"),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 190, bottom: 190),
        child: Stack(children: <Widget>[
          Card(
            elevation: 25,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Expanded(
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Login',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.fredokaOne(
                          fontSize: 31,
                          // foreground: Paint()
                          //   ..shader = LinearGradient(
                          //     colors: <Color>[
                          //       HexColor("#6899f5"),
                          //       HexColor("#d173bb"),
                          //     ],
                          //   ).createShader(
                          //       Rect.fromLTWH(0.0, 0.0, 400.0, 100.0)),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        validator: (value) {
                          var regexp = !RegExp(
                                  "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$")
                              .hasMatch(value ?? "");
                          if (value!.isEmpty) {
                            return 'Please enter username';
                          } else if (regexp) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        controller: usernameCntrlr, //detects the controller
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0.0),
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppTheme.nearlyDarkBlue,
                            ),
                            labelText: 'Username',
                            labelStyle:
                                TextStyle(color: AppTheme.nearlyDarkBlue)),
                      ),
                      const SizedBox(
                        height: 10,
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
                        obscureText: obscure,
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: InkWell(
                                  child: Icon(
                                    FontAwesomeIcons.eyeSlash,
                                    size: 12,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      obscure = !obscure;
                                    });
                                  },
                                )),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppTheme.nearlyDarkBlue,
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: AppTheme.nearlyDarkBlue,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPasswordPage()),
                              );
                            },
                            child: Text(
                              "Forget Password ?",
                              style: TextStyle(color: AppTheme.nearlyDarkBlue),
                            ),
                          )),
                      const SizedBox(
                        height: 23,
                      ),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppTheme.nearlyDarkBlue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ))),
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
                                MaterialPageRoute(
                                    builder: (context) => AppHomeScreen()),
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
                        child: SizedBox(
                          width: 300,
                          height: 30,
                          child: Center(
                              child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
