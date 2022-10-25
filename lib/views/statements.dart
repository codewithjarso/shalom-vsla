// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:vsla/views/Pending_loans.dart';
import 'package:vsla/views/waivers/loan_progress.dart';
import 'package:vsla/views/waivers/received.dart';
import 'package:vsla/widgets/widgets.dart';
import 'landing_page.dart';

class Statements extends StatelessWidget {
  const Statements({Key? key}) : super(key: key);
  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
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
          'My Statements',
          style: const TextStyle(fontSize: 28, color: Colors.black),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: ListView(children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: const Text(
              'Loans',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Statements(),
              ),
            ),
            leading: const Icon(Icons.payment),
            title: const Text('Paid'),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Received(),
              ),
            ),
            leading: const Icon(Icons.paid_outlined),
            title: const Text('Received'),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoanProgress())),
            leading: const Icon(Icons.wifi_protected_setup_sharp),
            title: const Text('In progress'),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PendingLoans())),
            leading: const Icon(Icons.pending_actions_outlined),
            title: const Text('Pending Loans'),
          ),
        ]),
      ),
      body: LiquidPullToRefresh(
        springAnimationDurationInMilliseconds: 500,
        animSpeedFactor: 2.0,
        showChildOpacityTransition: false,
        color: Colors.grey[300],
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Loans payment statements',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      textBaseline: TextBaseline.alphabetic,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.lerp(
                          FontWeight.normal, FontWeight.bold, 0.2)),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    horizontalMargin: 12,
                    dividerThickness: 5,
                    showBottomBorder: true,
                    sortAscending: true,
                    showCheckboxColumn: true,
                    //columnSpacing: 16,
                    columns: [
                      const DataColumn(label: const Text('Name')),
                      const DataColumn(label: const Text('Account')),
                      const DataColumn(label: const Text('Amount\n paid')),
                      const DataColumn(label: const Text('Date')),
                      const DataColumn(label: const Text('Time')),
                    ],
                    rows: [
                      const DataRow(cells: [
                        const DataCell(Text('Stephen Jarso')),
                        const DataCell(const Text('002')),
                        const DataCell(const Text('5000')),
                        const DataCell(Text('24/08/22')),
                        const DataCell(Text('02:34 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(const Text('Stephen Jarso')),
                        const DataCell(const Text('002')),
                        const DataCell(const Text('5000')),
                        const DataCell(Text('24/08/22')),
                        const DataCell(Text('03:24 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(const Text('Stephen')),
                        const DataCell(const Text('002')),
                        const DataCell(Text('5000')),
                        const DataCell(Text('24/08/22')),
                        const DataCell(Text('04:30 PM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(Text('Stephen')),
                        const DataCell(Text('002')),
                        const DataCell(Text('5000')),
                        const DataCell(const Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(const Text('Stephen')),
                        const DataCell(const Text('002')),
                        const DataCell(const Text('5000')),
                        const DataCell(const Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(const Text('Stephen')),
                        const DataCell(const Text('002')),
                        const DataCell(const Text('5000')),
                        const DataCell(Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(Text('Stephen')),
                        const DataCell(Text('002')),
                        const DataCell(Text('5000')),
                        const DataCell(Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(const Text('Stephen')),
                        const DataCell(Text('002')),
                        const DataCell(const Text('5000')),
                        const DataCell(const Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(const Text('Stephen')),
                        const DataCell(const Text('002')),
                        const DataCell(const Text('5000')),
                        const DataCell(Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(Text('Stephen')),
                        const DataCell(Text('002')),
                        const DataCell(Text('5000')),
                        const DataCell(Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(Text('Stephen')),
                        const DataCell(Text('002')),
                        const DataCell(const Text('5000')),
                        const DataCell(const Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(const Text('Stephen')),
                        const DataCell(const Text('002')),
                        const DataCell(const Text('5000')),
                        const DataCell(const Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(Text('Stephen')),
                        const DataCell(const Text('002')),
                        const DataCell(Text('5000')),
                        const DataCell(Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(Text('Stephen')),
                        const DataCell(Text('002')),
                        const DataCell(const Text('5000')),
                        const DataCell(const Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(const Text('Stephen')),
                        const DataCell(const Text('002')),
                        const DataCell(const Text('5000')),
                        const DataCell(const Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        const DataCell(const Text('Stephen Jarso')),
                        const DataCell(const Text('002')),
                        const DataCell(Text('5000')),
                        const DataCell(Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                      const DataRow(cells: [
                        DataCell(Text('Stephen Jarso')),
                        DataCell(Text('002')),
                        DataCell(Text('5000')),
                        DataCell(Text('24/08/22')),
                        const DataCell(Text('03:30 AM')),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
