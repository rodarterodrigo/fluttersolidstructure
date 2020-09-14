import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarquitetureapp/modules/search/domain/entities/result_search.dart';
import 'package:flutterarquitetureapp/modules/search/domain/errors/errors.dart';
import 'package:flutterarquitetureapp/modules/search/domain/repositories/search_repository.dart';
import 'package:flutterarquitetureapp/modules/search/domain/usercases/search_by_text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryTestMock extends Mock implements ISearchRepository{}

main(){

  final repository = SearchRepositoryTestMock();
  final usecase = SearchByText(repository);

  test("Must return a resultSearchList.", () async {
    when(repository.search(any)).thenAnswer((realInvocation) async => Right(List<ResultSearch>()));
    final result = await usecase("rodarte");
    expect(result | null, isA<List<ResultSearch>>());
  });

  test("Must return a Exception.", () async {
    when(repository.search(any)).thenAnswer((realInvocation) async => Right(List<ResultSearch>()));
    var result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usecase("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });

  test("Must return a resultSearchList.", () async {
    when(repository.search(any)).thenThrow(InvalidTextError());
    final result = await usecase("rodarte");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}