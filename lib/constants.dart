import 'package:flutter/material.dart';

const countryName = [
  'Country',
  'INR',
  'USD',
  'JPY',
  'GBP',
  'AUD',
  'CAD',
  'CHF',
  'CNH',
  'SEK',
  'NZD'
];

var boxShadow = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: Color(0xFFF2F6FC),
  boxShadow: [
    BoxShadow(
      color: Color(0xFFF2F6FC),
      blurRadius: 15.0, // soften the shadow
      spreadRadius: 2.0, //extend the shadow
      offset: Offset(
        5.0, // Move to right 10  horizontally
        10.0, // Move to bottom 10 Vertically
      ),
    )
  ],
);

var textStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black.withOpacity(0.5),
);
