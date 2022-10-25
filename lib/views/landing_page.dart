// ignore_for_file: sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vsla/chats/groupchats.dart';
import 'package:vsla/google_spreadsheet_api/users.dart';

import 'package:vsla/modals/my_account.dart';
import 'package:vsla/modals/user.dart';
import 'package:vsla/services/auth.dart';
import 'package:vsla/utils/buttons.dart';
import 'package:vsla/views/loans/loan_request.dart';
import 'package:vsla/views/myshares.dart';
import 'package:vsla/views/auth/signup.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vsla/views/statements.dart';
import 'package:vsla/views/transactions.dart';
import 'package:vsla/views/waivers/waiver_form.dart';
import 'package:vsla/views/waivers/waivers.dart';
import 'package:vsla/widgets/widgets.dart';

import '../notifications/notifications.dart';
import '../utils/my_cards.dart';
import 'loans/loanrequests.dart';
import 'notifications.dart';

class LandinPage extends StatefulWidget {
  const LandinPage({Key? key}) : super(key: key);

  @override
  State<LandinPage> createState() => _LandinPageState();
}

class _LandinPageState extends State<LandinPage> {
  final _controller = PageController();
  var user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var yourActiveIndex;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
              ),
              color: Colors.black,
            );
          }),
          backgroundColor: Colors.grey[300],
          elevation: 0.0,
          title: const Text(
            'My Dashboard',
            style: TextStyle(fontSize: 28, color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications())),
                icon: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.grey[400], shape: BoxShape.circle),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[500],
          child: ListView(children: [
            UserAccountsDrawerHeader(
              currentAccountPictureSize: Size(200, 90),
              //currentAccountPictureSize: Size(25, 25),
              arrowColor: Colors.black,
              decoration: BoxDecoration(color: Colors.grey[500]),
              accountName: Text(""),
              accountEmail: Text(
                user.email.toString(),
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                child: const Text('S'),
                backgroundColor: Colors.teal[400],
              ),
            ),
            ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandinPage(),
                ),
              ),
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyAccount(),
                ),
              ),
              leading: const Icon(Icons.account_balance),
              title: const Text('My account'),
            ),
            ListTile(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoanRequestForm())),
              leading: const Icon(Icons.add_card_outlined),
              title: const Text('Request loan'),
            ),
            ListTile(
              onTap: () {
                signOut();
              },
              leading: const Icon(Icons.logout),
              title: const Text('sign out'),
            ),
          ]),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                //cards
                Container(
                  height: 200,
                  child: PageView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const MyShares())),
                        child: const MyCards(
                          color: Color.fromARGB(255, 67, 58, 84),
                          name: 'Shares',
                          amount: 500.00,
                        ),
                      ),
                      const MyCards(
                        color: Color.fromARGB(255, 92, 41, 41),
                        name: 'Penalty',
                        amount: 200.00,
                      ),
                      const MyCards(
                        color: Color.fromARGB(255, 29, 58, 30),
                        name: 'Welfare',
                        amount: 200.00,
                      ),
                      const MyCards(
                        color: Color.fromARGB(255, 35, 45, 61),
                        name: 'Loans',
                        amount: 5000,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),

                SmoothPageIndicator(
                  controller: _controller, // PageController
                  count: 4,

                  // forcing the indicator to use a specific direction
                  textDirection: TextDirection.ltr,
                  effect: const ExpandingDotsEffect(),
                ),

                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //waiver button
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Waivers()));
                          },
                          child: MyButton(
                            name: 'Waiver',
                            image: 'assets/letter1.png',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Waivers()));
                          },
                          child: MyButton(
                            name: 'Attendance',
                            image: 'assets/analytics.png',
                          ),
                        ),
                        //withdrawal button
                        TextButton(
                          onPressed: () {},
                          child: MyButton(
                            name: 'Withdrawals',
                            image: 'assets/withdrawal.png',
                          ),
                        ),
                        //expenses
                        TextButton(
                          onPressed: () {},
                          child: MyButton(
                            name: 'Expenses',
                            image: 'assets/budget.png',
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: MyButton(
                            name: 'Penalty',
                            image: 'assets/bail.png',
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Statements()));
                    },
                    child: Column(
                      //Stastics
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Image.asset('assets/income.png'),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Statements',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      'Payments and income',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600]),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade700,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Transactions()));
                    },
                    child: Column(
                      //Transactions
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Image.asset('assets/transaction.png'),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Transactions',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      'Transaction history',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600]),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade700,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoanRequest())),
                    child: Column(
                      //Loans
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Image.asset('assets/personal.png'),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Loans',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      'Request loans',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade700,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GroupChats()));
          },
          child: Center(
            child: Icon(
              Icons.chat,
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked);
  }
}
