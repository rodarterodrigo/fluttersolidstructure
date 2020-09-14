import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarquitetureapp/modules/search/infra/datasources/search_datasource.dart';
import 'package:flutterarquitetureapp/modules/search/infra/models/result_search_model.dart';
import 'package:flutterarquitetureapp/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutterarquitetureapp/modules/search/domain/entities/result_search.dart';
import 'package:flutterarquitetureapp/modules/search/domain/errors/errors.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements SearchDataSource{
}
main(){

  final dataSource = SearchDataSourceMock();
  final repository = SearchRepository(dataSource);

  test("Must return a ResultSearchList", () async{
    when(dataSource.getSearch(any)).thenAnswer((realInvocation) async => List<ResultSearchModel>());
    final result = await repository.search("rodarte");
    expect(result | null, isA<List<ResultSearch>>());
  });

  test("Must return a Exception", () async{
    when(dataSource.getSearch(any)).thenThrow((DataSourceError()));
    final result = await repository.search(null);
    expect(result.fold(id, id), isA<DataSourceError>());
  });

  test("Must return a Exception", () async{
    when(dataSource.getSearch(any)).thenAnswer((realInvocation) async => List<ResultSearchModel>());
    final result = await repository.search(null);
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}