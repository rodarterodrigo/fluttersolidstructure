import 'package:flutterarquitetureapp/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:flutterarquitetureapp/modules/search/domain/errors/errors.dart';
import 'package:flutterarquitetureapp/modules/search/domain/repositories/search_repository.dart';

abstract class ISearchByText{
  Future<Either<FailureSearch, List<ResultSearch>>>call(String searchText);
}

class SearchByText implements ISearchByText{

  final ISearchRepository repository;

  SearchByText(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText) async {
    try {
      return searchText == null? Left(InvalidTextError()): searchText.isEmpty? Left(InvalidTextError()): await repository.search(searchText);
    }
    catch(e){
      return Left(InvalidTextError());
    }
  }
}