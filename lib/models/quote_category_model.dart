List<QuoteCategory> quotesfromJson(List<dynamic> quotesJson) =>
    quotesJson.map((quoteJson) => QuoteCategory.fromJson(quoteJson)).toList();

class QuoteCategory {
  int? id;
  String? quoteCategory;

  QuoteCategory({
    this.quoteCategory,
  });

  QuoteCategory.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) id = json['id'];
    quoteCategory = json['quoteCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quoteCategory'] = quoteCategory;

    return data;
  }
}
