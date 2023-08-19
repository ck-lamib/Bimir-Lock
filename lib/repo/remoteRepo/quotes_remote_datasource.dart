import 'dart:convert';
import 'dart:developer';

import 'package:bimir_lock/models/quote_model.dart';
import 'package:http/http.dart' as http;

class QuotesRemoteDatasource {
  //take requesto handler from const param
  // QuotesRemoteDatasource();
  Future<List<Quote>?> getQuotes({String? category = "success", int limit = 3}) async {
    var headers = {
      'X-Api-Key': 'F5sdBIU08xRDwzeww7nLFVpm3MxMUFW7q0c3tOJw',
    };
    var url = Uri.parse("https://api.api-ninjas.com/v1/quotes?category=$category&limit=$limit");
    // var contentType = 'application/json';
    try {
      var response = await http.get(url, headers: headers);
      var quotesList = quotesfromJson(jsonDecode(response.body));
      return quotesList;
    } catch (e) {
      log("==============>>>>> Error while fetching quotes: $e");
      return null;
    }
  }
}
