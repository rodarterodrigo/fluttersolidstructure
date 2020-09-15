import 'package:flutterarquitetureapp/modules/search/domain/entities/result_search.dart';
import 'package:flutterarquitetureapp/modules/search/domain/errors/errors.dart';

abstract class SearchState{}

class SearchSuccess implements SearchState{
  final List<ResultSearch> list;
  SearchSuccess(this.list);
}

class SearchError implements SearchState{
  final FailureSearch failureSearch;
  SearchError(this.failureSearch);
}

class SearchLoad implements SearchState{

}

class SearchStart implements SearchState{

}