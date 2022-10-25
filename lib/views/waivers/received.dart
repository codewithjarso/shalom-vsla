import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:vsla/views/statements.dart';

class Received extends StatelessWidget {
  const Received({Key? key}) : super(key: key);
  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Statements()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
        title: const Text(
          'Loans received statements',
          style: TextStyle(
              decoration: TextDecoration.underline,
              textBaseline: TextBaseline.alphabetic,
              fontSize: 24,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    horizontalMargin: 12,
                    dividerThickness: 5,
                    checkboxHorizontalMargin: 2,
                    showBottomBorder: true,
                    sortAscending: true,
                    showCheckboxColumn: true,
                    columnSpacing: 16,
                    columns: [
                      const DataColumn(label: const Text('Name')),
                      const DataColumn(label: const Text('Account')),
                      const DataColumn(label: const Text('Amount\n received')),
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
