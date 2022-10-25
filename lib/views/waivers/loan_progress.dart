import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gsheets/gsheets.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../statements.dart';

class LoanProgress extends StatefulWidget {
  const LoanProgress({Key? key}) : super(key: key);

  @override
  State<LoanProgress> createState() => _LoanProgressState();
}

class _LoanProgressState extends State<LoanProgress> {
  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  void onSort(int columnIndex, bool ascending) {
    setState(() {
      this.sortColumn = columnIndex;
      this.isAscending = ascending;
    });
  }

  int? sortColumn;
  bool isAscending = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
        elevation: 0.0,
        title: Text(
          'Loan requests in progress',
          style: TextStyle(
              decoration: TextDecoration.underline,
              textBaseline: TextBaseline.alphabetic,
              fontSize: 24,
              fontStyle: FontStyle.italic,
              //fontWeight: FontWeight,
              color: Colors.black),
        ),
        backgroundColor: Colors.grey,
      ),
      body: LiquidPullToRefresh(
        springAnimationDurationInMilliseconds: 500,
        animSpeedFactor: 2.0,
        showChildOpacityTransition: false,
        color: Colors.grey[300],
        onRefresh: _handleRefresh,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    sortAscending: isAscending,
                    sortColumnIndex: sortColumn,
                    columns: [
                      DataColumn(label: Text('Name'), onSort: onSort),
                      DataColumn(label: Text('loan \namount'), onSort: onSort),
                      DataColumn(label: Text('Account')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Period \n(mths)'))
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Stephen')),
                        DataCell(Text('ksh.50000')),
                        DataCell(Text('003')),
                        DataCell(Text('24/05/22')),
                        DataCell(Text('2')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Stephen')),
                        DataCell(Text('ksh.50000')),
                        DataCell(Text('003')),
                        DataCell(Text('24/05/22')),
                        DataCell(Text('2')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Stephen')),
                        DataCell(Text('ksh.50000')),
                        DataCell(Text('003')),
                        DataCell(Text('24/05/22')),
                        DataCell(Text('2')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Stephen')),
                        DataCell(Text('ksh.50000')),
                        DataCell(Text('003')),
                        DataCell(Text('24/05/22')),
                        DataCell(Text('2')),
                      ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
