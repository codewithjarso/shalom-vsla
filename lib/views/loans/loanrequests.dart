import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vsla/widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

import 'package:dropdownfield2/dropdownfield2.dart';

import '../../google_spreadsheet_api/users.dart';
import '../../modals/user.dart';

class LoanRequestForm extends StatefulWidget {
  const LoanRequestForm({Key? key}) : super(key: key);

  @override
  State<LoanRequestForm> createState() => _LoanRequestFormState();
}

class _LoanRequestFormState extends State<LoanRequestForm> {
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLoanType = TextEditingController();
  TextEditingController controllerAccount = TextEditingController();
  TextEditingController controllerAmount = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerId = TextEditingController();
  var format = DateFormat('yyyy-mm-d');
  final formKey = GlobalKey<FormState>();

  CollectionReference ref =
      FirebaseFirestore.instance.collection('loan request');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Text('Loan Request Form'),
        actions: [
          TextButton(
              onPressed: () async {
                final form = formKey.currentState!;
                final isValid = form.validate();
                if (isValid) {
                  ref.add({
                    'firstname': controllerFirstName.text,
                    'lastname': controllerLastName.text,
                    'loan type': controllerLoanType.text,
                    'account': controllerAccount.text,
                    'amount': controllerAmount.text,
                    'phone': controllerPhone.text,
                    'id': controllerId.text
                  }).whenComplete(() => Navigator.pop(context));
                  final user = User(
                      firstname: controllerFirstName.text,
                      id: controllerId.text,
                      accountNo: controllerAccount.text,
                      amount: controllerAmount.text,
                      loanType: controllerLoanType.text,
                      phone: controllerPhone.text,
                      lastname: controllerLastName.text);

                  await UserSheetApi.insert([user.toJson()]);
                }
              },
              child: Row(
                children: [
                  const Text(
                    'Save',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.save,
                    color: Colors.blue,
                  ),
                ],
              )),
        ],
      ),
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat().format(DateTime.now())),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'First Name:',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value!.length < 4 ? 'please provide first name' : null,
                    controller: controllerFirstName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter your first name',
                      hintStyle: TextStyle(
                        color: Colors.grey[800],
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Last Name:',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value!.length < 4 ? 'please provide first name' : null,
                    controller: controllerLastName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: ('Enter last name'),
                      hintStyle: TextStyle(
                        color: Colors.grey[800],
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'ID-NO:',
                    style: const TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'please provide an id number' : null,
                    controller: controllerId,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your idno i.e 33456765',
                      hintStyle: TextStyle(
                        color: Colors.grey[800],
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Account:',
                    style: const TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) => value!.isEmpty
                        ? "Enter your account code i.e 0.002"
                        : null,
                    controller: controllerAccount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your Account',
                      hintStyle: TextStyle(
                        color: Colors.grey[800],
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Amount:',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter amount' : null,
                    controller: controllerAmount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter amount to borrow in Ksh i.e 5000',
                      hintStyle: TextStyle(
                        color: Colors.grey[800],
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Loan Type:',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: DropDownField(
                      controller: controllerLoanType,
                      items: looanTypeSelected,
                      enabled: true,
                      hintText: 'select loan type...',
                      textStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.green),
                      onValueChanged: (value) {
                        setState(() {
                          selectLoan = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Phone:',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value!.length <= 9 ? 'Enter valid phone number' : null,
                    controller: controllerPhone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter your phone address',
                      hintStyle: TextStyle(
                        color: Colors.grey[800],
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String selectLoan = "";
List<String> looanTypeSelected = ['Emergency loan', 'Personal loan', 'Others'];
