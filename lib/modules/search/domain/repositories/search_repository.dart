import 'package:dartz/dartz.dart';
import 'package:flutterarquitetureapp/modules/search/domain/entities/result_search.dart';
import 'package:flutterarquitetureapp/modules/search/domain/errors/errors.dart';

abstract class ISearchRepository{
  Future<Either<FailureSearch, List<ResultSearch>>> search (String searchText);
}