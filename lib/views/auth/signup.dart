import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vsla/chats/database.dart';
import 'package:vsla/main.dart';
import 'package:vsla/services/auth.dart';
import 'package:vsla/views/landing_page.dart';
import 'package:vsla/views/auth/login.dart';

import 'package:vsla/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Databasemethods databaseMethods = Databasemethods();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  late TextEditingController controllerFirstName;
  late TextEditingController controllerSecondName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;

  signMeUp() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  void initState() {
    controllerFirstName = TextEditingController();
    controllerSecondName = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 47, 47),
      appBar: appBarMain(),
      body: isLoading
          ? const Center(
              // ignore: unnecessary_const
              child: const CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                alignment: Alignment.bottomCenter,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 70,
                                child: Image.asset(
                                  'assets/logo.png',
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                  validator: (value) {
                                    return value!.isEmpty || value.length < 4
                                        ? "provide full username i.e John Doe"
                                        : null;
                                  },
                                  controller: controllerFirstName,
                                  style: simpleTextStyle(),
                                  keyboardType: TextInputType.text,
                                  decoration: textInputDecoration(
                                      'firstname',
                                      const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ))),
                              const SizedBox(height: 10),
                              TextFormField(
                                  validator: (value) {
                                    return value!.isEmpty || value.length < 4
                                        ? "provide full username i.e John Doe"
                                        : null;
                                  },
                                  controller: controllerSecondName,
                                  style: simpleTextStyle(),
                                  keyboardType: TextInputType.text,
                                  decoration: textInputDecoration(
                                      'secondname',
                                      const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ))),
                              const SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                  validator: (value) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value.toString())
                                        ? null
                                        : 'please provide a valid email';
                                  },
                                  controller: controllerEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  style: simpleTextStyle(),
                                  decoration: textInputDecoration(
                                      'email',
                                      const Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ))),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (value) => value!.length <= 9
                              ? 'Enter valid password'
                              : null,
                          controller: controllerPassword,
                          style: simpleTextStyle(),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: (() {
                                FocusScope.of(context).unfocus();
                              }),
                              child: const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'password',
                            hintStyle: const TextStyle(
                              color: Colors.white54,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: textInputDecoration(
                              'Confirm password',
                              const Icon(
                                Icons.lock,
                                color: Colors.white,
                              )),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color(0xff007EF4),
                                Color(0xff2A75BC),
                              ]),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () async {
                              signMeUp();
                              Map<String, String> userInfoMap = {
                                "name": controllerFirstName.text,
                                "secondname": controllerSecondName.text,
                              };

                              bool shouldNavigate = await register(
                                  controllerEmail.text,
                                  controllerPassword.text,
                                  controllerFirstName.text,
                                  controllerSecondName.text,
                                  context);
                              if (shouldNavigate) {
                                databaseMethods.uploadUserInfo(userInfoMap);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VerifyEmail()));
                              }
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                )),
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login())),
                              child: const Text(
                                "sign in now",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50.0,
                        )
                      ],
                    )),
              ),
            ),
    );
  }
}
