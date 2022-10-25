import 'package:flutter/material.dart';

AppBar appBarMain() {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 32, 47, 47),
    elevation: 0,
    title: const Text('Shalom VSLA'),
  );
}

InputDecoration textInputDecoration(String hintText, Widget icon) {
  return InputDecoration(
    icon: icon,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.white54,
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(15)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(15)),
  );
}

simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16.0);
}

TextStyle mediumTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 17.0);
}

TextStyle largeTextStyle() {
  return TextStyle(
      color: Colors.black, fontSize: 40, fontStyle: FontStyle.italic);
}
