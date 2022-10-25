import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../google_spreadsheet_api/users.dart';
import '../modals/user.dart';
import 'loans/loanrequests.dart';

class EditPage extends StatefulWidget {
  DocumentSnapshot docToEdit;
  EditPage({Key? key, required this.docToEdit}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLoanType = TextEditingController();
  TextEditingController controllerAccount = TextEditingController();
  TextEditingController controllerAmount = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerId = TextEditingController();
  @override
  void initState() {
    controllerFirstName =
        TextEditingController(text: widget.docToEdit.get('firstname'));
    controllerLoanType =
        TextEditingController(text: widget.docToEdit.get('loan type'));
    controllerAccount =
        TextEditingController(text: widget.docToEdit.get('account'));
    controllerAmount =
        TextEditingController(text: widget.docToEdit.get('amount'));
    controllerId = TextEditingController(text: widget.docToEdit.get('id'));
    controllerPhone =
        TextEditingController(text: widget.docToEdit.get('phone'));
    controllerLastName =
        TextEditingController(text: widget.docToEdit.get('lastname'));
    // TODO: implement initState
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        elevation: 0,
        title: Text('Edit Loan Request'),
        actions: [
          TextButton(
              onPressed: () async {
                widget.docToEdit.reference.update({
                  'firstname': controllerFirstName.text,
                  'lastname': controllerLastName.text,
                  'loan type': controllerLoanType.text,
                  'account': controllerAccount.text,
                  'amount': controllerAmount.text,
                  'phone': controllerPhone.text,
                  'id': controllerId.text
                }).whenComplete(() => Navigator.pop(context));

                final form = formKey.currentState!;
                final isValid = form.validate();
                if (isValid) {
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
                  Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'First Name:',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) => value!.length < 6
                        ? 'please provide full names i.e John Doe'
                        : null,
                    controller: controllerFirstName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter your first name i.e John Doe',
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
                        value!.isEmpty ? 'Enter date today\' date' : null,
                    controller: controllerLastName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Enter today\'s date i.e 22/02/22',
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
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Enter type of loan' : null,
                    controller: controllerLoanType,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter loan type i.e emergengy',
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () async {
                          widget.docToEdit.reference
                              .delete()
                              .whenComplete(() => Navigator.pop(context));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_outline_outlined,
                              color: Colors.red,
                            ),
                            Text(
                              'delete',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
