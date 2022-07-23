import 'package:flutter/material.dart';
import 'package:my_application/apptheme/app_theme.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({Key? key, this.title});

  final String? title;
  @override
  _ForgetPasswordPage createState() => _ForgetPasswordPage();
}

class _ForgetPasswordPage extends State<ForgetPasswordPage> {
  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // created global key for form
  //created controller
  TextEditingController usernameCntrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.appbarColor,
        toolbarHeight: 100,
        title: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Forget Password',
                textAlign: TextAlign.left, style: AppTheme.title)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen[50],
          borderRadius: const BorderRadius.all(const Radius.circular(40)),
        ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                controller: usernameCntrlr, //detects the controller
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: AppTheme.nearlyDarkBlue,
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: AppTheme.nearlyDarkBlue)),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: AppTheme.nearlyDarkBlue))
            ],
          ),
        ),
      ),
    );
  }
}
