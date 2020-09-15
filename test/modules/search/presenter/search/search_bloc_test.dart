import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarquitetureapp/modules/search/domain/entities/result_search.dart';
import 'package:flutterarquitetureapp/modules/search/domain/usercases/search_by_text.dart';
import 'package:flutterarquitetureapp/modules/search/presenter/search/search_bloc.dart';
import 'package:flutterarquitetureapp/modules/search/presenter/search/states/state.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

class SearchByTextMock extends Mock implements SearchByText{}

main(){
  final useCase = SearchByTextMock();
  final searchBloc = SearchBloc(useCase);

  test("Must return the states on the correct order",(){
    when(useCase.call(any)).thenAnswer((realInvocation) async => Right(List<ResultSearch>()));
    expect(searchBloc, emitsInOrder([
      isA<SearchLoad>(),
      isA<SearchSuccess>(),
    ]));
    searchBloc.add("rodarterodrigo");
  });
}