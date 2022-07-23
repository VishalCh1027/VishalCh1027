import 'package:flutter/material.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/login/service.dart';
import 'package:my_application/ui/screens/dashboardscreen.dart';
import 'package:my_application/ui/screens/forgetpasswordscreen.dart';
import 'package:my_application/ui/widgets/Loading_dailog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  double? padding = 50;
  var obscure = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 180,
              width: 180,
              child: Image.asset(
                'assets/Alyn_Logo.jpg',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  margin: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.5),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 8.0),
                    ],
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Login',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              letterSpacing: 0.27,
                              color: AppTheme.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
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
                                  color: AppTheme.secondaryColor,
                                ),
                                labelText: 'Username',
                                labelStyle:
                                    TextStyle(color: AppTheme.secondaryColor)),
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
                              contentPadding: EdgeInsets.all(0),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: InkWell(
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    size: 12,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      obscure = !obscure;
                                    });
                                  },
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppTheme.secondaryColor,
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: AppTheme.secondaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgetPasswordPage()),
                                );
                              },
                              child: Text(
                                "Forget Password ?",
                                style:
                                    TextStyle(color: AppTheme.secondaryColor),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          _buildloginbutton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildloginbutton() {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppTheme.secondaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          LoadingDialog.showLoadingDialog(context);
          var account = await LoginService()
              .logIn(usernameCntrlr.text, passwordCntrlr.text);

          LoadingDialog.hideLoadingDialog(context);
          if (account != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardScreen(),
              ),
            );
          } else {
            Alert(
                    context: context,
                    title: "Login Failed",
                    desc: "Wrong password.")
                .show();
          }
        } else {
          setState(() {
            padding = 0;
          });
          Alert(
                  context: context,
                  title: "Login Failed",
                  desc: "invalid Attempt.")
              .show();
        }
      },
      child: const SizedBox(
        width: 300,
        height: 30,
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(color: AppTheme.logoColor, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppTheme.secondaryColor
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.17);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.01,
        size.width * 0.5, size.height * 0.12);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.24,
        size.width * 1.0, size.height * 0.1);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
