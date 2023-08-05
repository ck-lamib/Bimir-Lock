import 'package:bimir_lock/features/introductionPage/data/datasource/quotes/quotes_remote_datasource.dart';

import '../../domain/repo/quotes_repo.dart';

class QuotesRepoImpl implements QuotesRepo {
  //get datasource from constructor
  QuotesRepoImpl({required QuotesRemoteDatasource datasource}) : _quotesApiServices = datasource;
  final QuotesRemoteDatasource _quotesApiServices;
  @override
  void getQuotes() {
    _quotesApiServices.getQuotes();
  }
}
