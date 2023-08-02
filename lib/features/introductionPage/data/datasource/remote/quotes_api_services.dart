import 'dart:convert';

import 'package:bimir_lock/models/quote_model.dart';
import 'package:http/http.dart' as http;

class QuotesApiServices {
  getQuotes({String? category}) async {
    var headers = {
      'X-Api-Key': 'F5sdBIU08xRDwzeww7nLFVpm3MxMUFW7q0c3tOJw',
    };
    var url = Uri.parse("https://api.api-ninjas.com/v1/quotes?category=$category&limit=5");
    // var contentType = 'application/json';
    var response = await http.get(url, headers: headers);
    var quotesList = quotesfromJson(jsonDecode(response.body));
    print(quotesList[1].quote);
  }
}
