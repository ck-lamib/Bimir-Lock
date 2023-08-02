import 'package:bimir_lock/features/introductionPage/data/datasource/remote/quotes_api_services.dart';

import '../../domain/repo/quotes_repo.dart';

class QuotesRepoImpl implements QuotesRepo {
  final QuotesApiServices _quotesApiServices = QuotesApiServices();
  @override
  void getQuotes() {
    _quotesApiServices.getQuotes();
  }
}
