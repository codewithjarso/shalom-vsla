import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  final String name;
  final double amount;
  final color;

  const MyCards(
      {Key? key, required this.name, required this.amount, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: 300,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'My Account',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/visa.png',
                  height: 60,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Ksh." + amount.toString(),
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'account.no',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '*****002',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
