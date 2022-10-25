import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WaiverForm extends StatefulWidget {
  const WaiverForm({Key? key}) : super(key: key);

  @override
  State<WaiverForm> createState() => _WaiverFormState();
}

class _WaiverFormState extends State<WaiverForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('waivers');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text('Waiver \& letter form'),
        actions: [
          TextButton(
            onPressed: () {
              ref.add({
                "title": titleController.text,
                "content": contentController.text
              }).whenComplete(() => Navigator.pop(context));
            },
            child: Icon(
              Icons.done,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: ' Title'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: contentController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: ' Write something...'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
