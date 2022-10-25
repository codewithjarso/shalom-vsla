import 'package:flutter/material.dart';

class FeedbackModel {
  String name;
  String date;
  String shares;
  String time;
  String account;
  FeedbackModel(
      {required this.name,
      required this.date,
      required this.shares,
      required this.time,
      required this.account});
  factory FeedbackModel.fromJson(dynamic json) {
    return FeedbackModel(
      name: "${json['name']}",
      date: "${json['date']}",
      shares: "${json['shares']}",
      time: "${json['time']}",
      account: "${json['account']}",
    );
  }
  Map toJson() => {
        'name': name,
        'date': date,
        'shares': shares,
        'time': time,
        'account': account
      };
}
