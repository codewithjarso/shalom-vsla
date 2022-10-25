import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vsla/widgets/widgets.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Account'),
        ),
        body: ListView(children: [
          Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    //width: MediaQuery.of(context).size.width / 2,
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 3,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 183, 244, 238),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'Shares',
                      style: largeTextStyle(),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 3,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 178, 248, 241),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'Penalty',
                      style: largeTextStyle(),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 3,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 162, 239, 232),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'welfare',
                      style: largeTextStyle(),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 3,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 165, 229, 223),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'Loan',
                      style: largeTextStyle(),
                    )),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 3,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 167, 217, 213),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                'Others',
                style: largeTextStyle(),
              )),
            ),
          ]),
        ]));
  }
}
