// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:vsla/modals/user.dart';
import 'package:vsla/views/edit_page.dart';

import 'package:vsla/views/loans/loanrequests.dart';
import 'package:vsla/widgets/widgets.dart';

class LoanRequest extends StatefulWidget {
  LoanRequest({Key? key}) : super(key: key);

  @override
  State<LoanRequest> createState() => _LoanRequestState();
}

class _LoanRequestState extends State<LoanRequest> {
  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> get(LoanRequest) {
    return StreamBuilder(
      stream: ref.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return GridView.builder(
            itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                height: 180,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 26, 69, 27),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'awaiting approval...',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                          'Loan Amount: \nksh.' +
                              snapshot.data!.docs[index].get('amount'),
                          style: simpleTextStyle()),
                      Text(
                        'Type:\n' + snapshot.data!.docs[index].get('loan type'),
                        style: simpleTextStyle(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //Text(DateFormat.jm().format(DateTime(2022)),
                          TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditPage(
                                            docToEdit:
                                                snapshot.data!.docs[index],
                                          ))),
                              child: Row(
                                children: [
                                  //
                                  const Text(
                                    'Edit',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 16),
                                  ),
                                  const Icon(
                                    Icons.edit_attributes_outlined,
                                    color: Colors.red,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

  final user = FirebaseAuth.instance.currentUser;
  final ref = FirebaseFirestore.instance.collection('loan request');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 113, 123, 138),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 45, 61),
        title: const Text('My Loan Requests'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoanRequestForm())),
        child: const Icon(Icons.add),
        autofocus: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: get(LoanRequest),
      bottomNavigationBar: const Tab(
          child: Text('Note:loans cannot be edited once approved...')),
    );
  }
}
