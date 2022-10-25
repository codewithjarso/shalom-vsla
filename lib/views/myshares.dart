import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gsheets/gsheets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:vsla/modals/feeback.dart';

class MyShares extends StatefulWidget {
  const MyShares({Key? key}) : super(key: key);

  @override
  State<MyShares> createState() => _MySharesState();
}

class _MySharesState extends State<MyShares> {
  List<FeedbackModel> feedbacks = <FeedbackModel>[];

  final url = Uri.parse(
      'https://script.google.com/macros/s/AKfycbyyUDodsZ2qnf50Lp7OxG3v9kjSe63a0EmiiDEecne0T8v9FGig5lzzh2bDcu6tkbamyQ/exec');
  getFeedbackFromSheet() async {
    // ignore: prefer_const_declarations
    final raw = await http.get(url);
    print(raw);

    var jsonFeedback = convert.jsonDecode(raw.body);
    print("This is a json feedback $jsonFeedback");
    feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shares'),
        elevation: 0,
      ),
      body: Container(),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  const FeedbackTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name, date, shares, time, account;
    return Container(
      child: Row(
        children: [],
      ),
    );
  }
}
