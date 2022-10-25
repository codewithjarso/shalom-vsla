// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:vsla/widgets/widgets.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);
  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey.shade400,
            title: Text(
              'Transactions history',
              style: const TextStyle(fontSize: 28, color: Colors.black),
            )),
        body: LiquidPullToRefresh(
          color: Colors.deepPurple,
          onRefresh: _handleRefresh,
          child: ListView(children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.green,
                              size: 50,
                            ),
                            Text(
                              'deposit',
                              style: TextStyle(
                                  color: Colors.lightGreenAccent, fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ksh.5000',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Text(
                              'Shares',
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 32),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('12:45'),
                            Text('Date:12 aug,2022'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_downward_rounded,
                              color: Colors.red,
                              size: 50,
                            ),
                            Text(
                              'withdrawal',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ksh.50000',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Text(
                              'Loan',
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 32),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('3:45'),
                            Text('Date:12 aug,2022'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.green,
                              size: 50,
                            ),
                            Text(
                              'deposit',
                              style: TextStyle(
                                  color: Colors.lightGreenAccent, fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ksh.50',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Text(
                              'welfare',
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 32),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('10:45'),
                            Text('Date:12 aug,2022'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.green,
                              size: 50,
                            ),
                            Text(
                              'deposit',
                              style: TextStyle(
                                  color: Colors.lightGreenAccent, fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ksh.5000',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Text(
                              'Loan Paid',
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 32),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('9:45'),
                            Text('Date:12 aug,2022'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_downward_rounded,
                              color: Colors.redAccent,
                              size: 50,
                            ),
                            Text(
                              'withdrawal',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ksh.5000',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Text(
                              'Loan',
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 32),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('12:45'),
                            Text('Date:12 aug,2022'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.green,
                              size: 50,
                            ),
                            Text(
                              'deposit',
                              style: TextStyle(
                                  color: Colors.lightGreenAccent, fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ksh.50',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Text(
                              'Servicefee',
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 32),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('12:45'),
                            Text('Date:12 aug,2022'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
