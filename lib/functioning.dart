import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String fromCountry, toCountry;
  double amount;

  var rate;
  //NetworkHelper(this.fromCountry, this.toCountry, this.amount);
  Future getData() async {
    String url =
        'http://data.fixer.io/api/latest?access_key=2d6c68679030e8ffd964dba23b87d1ae';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var listCurr = jsonDecode(data);
      rate = listCurr['rates'];
      print(rate);
      print(rate['USD']);
    }
  }

  double Convert() {
    if ('$fromCountry' != 'EUR') {
      amount = amount / rate['$fromCountry'];
    } else {
      amount = amount * rate['$toCountry'];
    }
    return amount;
  }
}
