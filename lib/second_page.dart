import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';

class SecondPage extends StatelessWidget {
  final String initialAmount;
  final String finalAmount;
  final String dropdownValue1;
  final String dropdownValue2;

  SecondPage(
      {this.initialAmount,
      this.finalAmount,
      this.dropdownValue1,
      this.dropdownValue2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB1C5C5),
      appBar: AppBar(
        title: Center(
          child: Text(
            ' Currency Converter ',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Color(0xFF54B0F3),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              decoration: boxShadow,
              margin: EdgeInsets.all(10),
              child: Center(
                  child: Text(
                      'Conversion of $initialAmount from $dropdownValue1 to $dropdownValue2 is $finalAmount')),
            ),
          ],
        ),
      ),
    );
  }
}
