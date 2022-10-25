import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:timezone/standalone.dart';
import 'package:vsla/chats/database.dart';

class GroupChats extends StatefulWidget {
  const GroupChats({Key? key, messageData}) : super(key: key);

  @override
  State<GroupChats> createState() => _GroupChatsState();
}

class _GroupChatsState extends State<GroupChats> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearch = Row(
    children: [
      CircleAvatar(
        child: Image.asset('assets/assets.png'),
        backgroundColor: Colors.white,
      ),
      SizedBox(
        width: 5,
      ),
      Column(
        children: [
          Text(overflow: TextOverflow.ellipsis, 'Shalom vsla group'),
          //Text(FirebaseFirestore.instance
          //  .collection("users")
          // )
        ],
      ),
    ],
  );
  Databasemethods databasemethods = new Databasemethods();
  static final user = FirebaseAuth.instance.currentUser!;
  final ref = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 32, 47, 47),
        appBar: AppBar(
          elevation: 0.0,
          title: cusSearch,
          actions: [
            IconButton(
              icon: cusIcon,
              onPressed: () {
                setState(() {
                  if (this.cusIcon.icon == Icons.search) {
                    this.cusIcon = Icon(Icons.clear);
                    this.cusSearch = TextField(
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Search...'),
                    );
                  } else {
                    this.cusIcon = Icon(Icons.search);
                    this.cusSearch = Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset('assets/assets.png'),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          children: [
                            Text(
                                overflow: TextOverflow.ellipsis,
                                'Shalom vsla group'),
                          ],
                        ),
                      ],
                    );
                  }
                });
                // databasemethods
                //     .getUserByUsername(searchTextEditingController.text);
              },
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.more_vert),
            SizedBox(
              width: 8,
            )
          ],
          backgroundColor: Color.fromARGB(255, 32, 65, 47),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8, top: 16.0, bottom: 100, right: 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 1),
                      child: Text(DateFormat.yMMMMd().format(DateTime.now())),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Trapkeed',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 183, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Hey man how are you doing?'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 2),
                              Text(
                                DateFormat.jm().format(DateTime.now()),
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ]),
        bottomNavigationBar: Tab(
          child: SafeArea(
              bottom: true,
              top: false,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                            width: 2, color: Theme.of(context).dividerColor),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Icon(CupertinoIcons.camera_fill),
                    ),
                  ),
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: TextField(
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      decoration: InputDecoration(
                          hintText: 'Message', border: InputBorder.none),
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 24.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send_rounded),
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              )),
        ));
  }
}
