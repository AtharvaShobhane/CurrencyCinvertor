import 'package:currency_converter/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'second_page.dart';
import 'constants.dart';
import 'functioning.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              ' Currency Converter ',
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Color(0xFF54B0F3),
        ),
        backgroundColor: Color(0xFFB1C5C5),
        body: Center(
          child: CurrencuInput(),
        ),
      ),
    );
  }
}

class CurrencuInput extends StatefulWidget {
  @override
  _CurrencuInputState createState() => _CurrencuInputState();
}

class _CurrencuInputState extends State<CurrencuInput> {
  String dropdownValue1 = 'Country';
  String dropdownValue2 = 'Country';
  String amount;
  String newAmount;
  double finalAmount;
  String stringfinalAmount;

  @override
  void initState() {
    NetworkHelper networkHelper = new NetworkHelper();
    networkHelper.getData();

    // TODO: implement initState
    super.initState();
  }

  NetworkHelper networkHelper = new NetworkHelper();
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 300,
          decoration: boxShadow,
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 10,
                width: 10,
              ),
              Icon(
                Icons.location_city,
                size: 30,
                //color: Colors.lightGreenAccent,
                color: Color(0xFF54B0F3),
              ),
              SizedBox(
                height: 10,
                width: 20,
              ),
              Text(
                'From ',
                style: textStyle,
              ),
              SizedBox(width: 10),
              Container(
                width: 150,
                child: DropdownButton<String>(
                  value: dropdownValue1,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  icon: Center(child: Icon(Icons.arrow_downward)),
                  onChanged: (String newValue1) {
                    setState(() {
                      dropdownValue1 = newValue1;
                    });
                    print(dropdownValue1);
                    newValue1 = networkHelper.fromCountry;
                  },
                  items:
                      countryName.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 70,
          width: 300,
          decoration: boxShadow,
          child: FlatButton(
            onPressed: () {},
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Icon(
                  Icons.location_city,
                  size: 30,
                  //color: Colors.lightGreenAccent,
                  color: Color(0xFF54B0F3),
                ),
                SizedBox(
                  height: 10,
                  width: 20,
                ),
                Text(
                  'To ',
                  style: textStyle,
                ),
                SizedBox(width: 10),
                Container(
                  width: 150,
                  child: DropdownButton<String>(
                    value: dropdownValue2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    icon: Center(child: Icon(Icons.arrow_downward)),
                    onChanged: (String newValue2) {
                      setState(() {
                        dropdownValue2 = newValue2;
                      });
                      newValue2 = networkHelper.toCountry;
                    },
                    items: countryName
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 70,
          width: 300,
          decoration: boxShadow,
          child: FlatButton(
            onPressed: () {},
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Icon(
                  Icons.attach_money,
                  size: 30,
                  //color: Color(0xFFFFD700),
                  color: Color(0xFF54B0F3),
                ),
                SizedBox(
                  height: 10,
                  width: 20,
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Amount',
                    ),
                    onChanged: (amount) {
                      newAmount = amount;
                      networkHelper.amount = double.parse(newAmount);
                    },
                    onSubmitted: (amount) {},
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 60,
          width: 200,
          decoration: boxShadow,
          child: FlatButton(
            onPressed: () {
              stringfinalAmount = networkHelper.Convert().toString();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                      initialAmount: this.newAmount,
                      finalAmount: this.stringfinalAmount,
                      dropdownValue1: this.dropdownValue1,
                      dropdownValue2: this.dropdownValue2),
                ),
              );
            },
            child: Text(
              'Convert',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
