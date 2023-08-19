List<QuoteCategory> quotesCategoryfromJson(List<dynamic> quotesCategoryJson) => quotesCategoryJson
    .map((quoteCategoryJson) => QuoteCategory.fromJson(quoteCategoryJson))
    .toList();

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
