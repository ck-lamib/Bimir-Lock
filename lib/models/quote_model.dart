List<Quote> quotesfromJson(List<dynamic> quotesJson) =>
    quotesJson.map((quoteJson) => Quote.fromJson(quoteJson)).toList();

class Quote {
  int? id;
  String? quote;
  String? author;

  Quote({
    this.quote,
    this.author,
  });

  Quote.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) id = json['id'];
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quote'] = quote;
    data['author'] = author;
    return data;
  }
}
