import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String onMessage = "waiting for notifications...";
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((event) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 47, 47),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 32, 47, 47),
          elevation: 0.0,
          title: Text('Notifications')),
      body: Center(
          child: Text(
        onMessage,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
