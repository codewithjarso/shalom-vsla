//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vsla/main.dart';
import 'package:vsla/modals/user.dart';

import 'package:vsla/services/auth.dart';
import 'package:vsla/views/auth/forgot_password.dart';
import 'package:vsla/views/landing_page.dart';
import 'package:vsla/views/auth/signup.dart';

import 'package:vsla/widgets/widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _name;
  late TextEditingController _email;
  late TextEditingController _password;
  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 47, 47),
      appBar: appBarMain(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 200,
          alignment: Alignment.bottomCenter,
          child: Container(
              //email
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    CircleAvatar(
                      radius: 70,
                      child: Image.asset('assets/logo.png'),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        style: simpleTextStyle(),
                        decoration: textInputDecoration(
                            'email',
                            Icon(
                              Icons.email,
                              color: Colors.white,
                            ))),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      controller: _password,
                      obscureText: true,
                      style: simpleTextStyle(),
                      decoration: textInputDecoration(
                          'password',
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                      ),
                      onPressed: () async {
                        bool shouldNavigate = await SignIn(
                            _name.text, _email.text, _password.text, context);
                        if (shouldNavigate) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LandinPage()));
                        }
                      },
                      icon: Icon(
                        Icons.lock_open,
                        size: 32.0,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Sign In',
                        style: simpleTextStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            )),
                        TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUp())),
                            child: Text(
                              'Register now',
                              style: TextStyle(
                                  fontSize: 17,
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
