import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vsla/views/waivers/waiver_form.dart';

class Waivers extends StatefulWidget {
  Waivers({Key? key}) : super(key: key);

  @override
  State<Waivers> createState() => _WaiversState();
}

class _WaiversState extends State<Waivers> {
  final ref = FirebaseFirestore.instance.collection('waivers');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WaiverForm()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('Waivers \& letters')),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return GridView.builder(
              itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisExtent: 210),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title: \n ' +
                              snapshot.data!.docs[index].get('title'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          child: OverflowBox(
                            alignment: Alignment.topLeft,
                            child: Text(
                              snapshot.data!.docs[index].get('content'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('awaiting acceptance...',
                                style: TextStyle(color: Colors.grey)),
                            TextButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              autofocus: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
