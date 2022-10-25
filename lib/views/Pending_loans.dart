import 'package:flutter/material.dart';

import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:vsla/views/statements.dart';
//import 'package:step_progress_indicator/step_progress_indicator.dart';

class PendingLoans extends StatelessWidget {
  PendingLoans({
    Key? key,
  }) : super(key: key);
  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
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
          'Pending Loan payments',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        backgroundColor: Colors.teal[200],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: ScrollableTableView(
            columns: [
              "Name",
              "Total to\nbe paid",
              "Loan Amount",
              "Interest",
              "Date\nIssued",
              "Due Date",
              "Status",
            ].map((column) {
              return TableViewColumn(
                label: column,
              );
            }).toList(),
            rows: [
              [
                "Stephen",
                "50500",
                "50000",
                "500",
                "24/08/22",
                "24/09/22",
                "Paid"
              ],
              ["Stephen", "20500", "20000", "500", "24/08/22", "25/11/22", "_"],
              [
                "Stephen",
                "20500",
                "20000",
                "500",
                "24/08/22",
                "25/11/22",
                "Paid"
              ],
              [
                "Stephen",
                "20500",
                "20000",
                "500",
                "24/08/22",
                "25/11/22",
                "Paid"
              ],
              ["Stephen", "20500", "20000", "500", "24/08/22", "25/11/22", "_"],
              ["Stephen", "20500", "20000", "500", "24/08/22", "25/11/22", "_"],
              ["Stephen", "20500", "20000", "500", "24/08/22", "25/11/22", "_"],
              ["Stephen", "20500", "20000", "500", "24/08/22", "25/11/22", "_"],
            ].map((record) {
              return TableViewRow(
                height: 60,
                cells: record.map((value) {
                  return TableViewCell(
                    child: Text(value),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
