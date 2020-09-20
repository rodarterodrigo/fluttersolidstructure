import 'package:dartz/dartz.dart';
import 'package:flutterarquitetureapp/modules/search/infra/datasources/search_datasource.dart';
import 'package:flutterarquitetureapp/modules/search/domain/entities/result_search.dart';
import 'package:flutterarquitetureapp/modules/search/domain/errors/errors.dart';
import 'package:flutterarquitetureapp/modules/search/domain/repositories/search_repository.dart';

class SearchRepository implements ISearchRepository{

  final SearchDataSource dataSource;

  SearchRepository(this.dataSource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText) async {
    try{
      return searchText == null? Left(DataSourceError()): searchText.isEmpty? Left(DataSourceError()): Right(await dataSource.getSearch(searchText));
    }
    on DataSourceError catch(Exception){
      return Left(Exception);
    }
    catch(e){
      return Left(DataSourceError());
    }
  }
}