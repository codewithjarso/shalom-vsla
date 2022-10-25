import 'package:flutter/foundation.dart';
import 'package:gsheets/gsheets.dart';
import 'package:vsla/modals/user.dart';

class UserSheetApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "vsla-d441a",
  "private_key_id": "5770cf01708e62765c4886339c3054c805cc6f89",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCmmFtdq0WaiI3o\nVeVaiAR6ln08D+IR2+/d1yYjU3RSpysi9ir2qRgO9o+H5LvxiHQQfAsfVBnEiUkk\nH/V7PU8IV/PMt1bt3xVfbBdtJMNV++N3x4zBGR8vRcxpvaVcM45wL3jJQ7ZEVjpe\n15rzpfsg0CAcVcqx0bBSCjsR/XE3SYngv+CD3d/wYT6r9t7uxaFISDfj18r9ltXO\nDqCNEEmEgf2aPjj40sRtK0So486Ift6rTYWT+W0P6BeY4SY6MG9Bz18phM4qcAWZ\n8+Xd3ZL/LkwpNXDAry/a8WtgqNifLT5EIK9FGuKL660m5Y0oWtlbMmmXhH+xU0Ba\nKS/HOBA/AgMBAAECggEACIFq2MNv0E38gMox5YdgQyn/xttAvYyvGHJtngwaukWS\nrDxJQUKs2ca42UVSWyiOVHEg2D6g+inQNCn1jI86w8BJ0D/kDkz/eFm6cHYaCv/L\nQ0hK5Wj08KLtptBp6uUu9odV8WClo6OLY2A6pwnoYmp92TSAHsgH6ohfL7Hy39Gq\nOvjYZnUwCpv2IhJk3ZaSP87w8vMsldmnFmbezkFtQPn5JgLl6/6wih3+dlpgFgq6\nXNd4J6Hdh8A9LIXtC8ujNYzGl7nm+5wG9d+YGV0nYYJOmpChA+IAoSmorjmuPPRI\nQjlLNXlbxAwBaYNr5uLEpJnL+pVN3zb00lz/RBFwEQKBgQDa0gm9lxWmnEWTXaB7\nxvqPZLThHKea/3PNWX32R1GcuV34KAQZF1MnhWWJhii0PsbYq49PwTqQD9a6V8H1\n+Imx1voy8SiiehVAa0cNuxPf4AUwbeye2cPAdnkAQTWqscvg5arv5qnZwMSWbPb3\njEfJkKAQPrVW2dWp5oaNX3awcwKBgQDC5rD7WLEUd3SEIXZzEhuR77nXeZkxmPkv\n7hCmNTN3NMhahpMvufkRmMYlTdFo6FY2sRq10ME4/mb74FR4zvz3Kt9C1BhURrHL\nT4gfN1l66cfu1JdZvkq5+fKKCpycqgMqYAY9jOpvquIeaf4VgngXCA0ttSJd5kUe\n/wyNNQ1qBQKBgQCQLgD5CQndA+7cEL7jj9IclXCROz48ZME6txLGKWve5kzCbCt3\nFOVXjw++M8WyLgL7VN9S37Dkp2sG0TgeCCtCILIuyrPJisNh9M2WgIOx6XvB00wr\nxrSypd1Ii67+z7PUdb/R3pxfvCJMM3Pu3GGYsFCnI4p8tX+ROTHDCPm9fQKBgCYH\nxbkF0Wfg90dhEC/b9K1BTc4R2CapZtZHadBEyUoVbpLbd5T0gPlCCkf1K0uBKnF5\nlXCsz0dDvOyhFVqNaScBopbzs9ud/8tgNXuB3V/yhiTALthAHWy0rPLqpyyasAtw\nuUcBXC119rFglUe1MaGs3IVytsYDzLEDq3tSQs/RAoGAF3BaPwzDOG3OGfQoJquP\nwwvhaF0QRcci7v43zy/q4mGhggCirvPYpf1HWX9fVaL36QB3cj4iSnLDZ0DQEhoD\ngZj0OJbTMkq1C219RyXeuMzvOPwsRc4eUW1Z9qcguJG7+8mv+NbwmA4/iL+5H1mb\n5k9dm14Oi9uTBTL/onsvKrM=\n-----END PRIVATE KEY-----\n",
  "client_email": "vsla-40@vsla-d441a.iam.gserviceaccount.com",
  "client_id": "102737665133716065786",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/vsla-40%40vsla-d441a.iam.gserviceaccount.com"
}
''';
  static final _spreadSheetId = '1iLGzD23dg0KhcEhb5LQOzOwAOfAierNTM6yNHyeMowk';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;
  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadSheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Loan Requests');
      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }
}
