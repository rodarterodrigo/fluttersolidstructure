import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarquitetureapp/modules/search/app_module.dart';
import 'package:flutterarquitetureapp/modules/search/domain/entities/result_search.dart';
import 'package:flutterarquitetureapp/modules/search/domain/usercases/search_by_text.dart';
import 'package:mockito/mockito.dart';

import 'utils/github_response.dart';

class DioMock extends Mock implements Dio{}

main(){
  final dio = DioMock();
  initModule(AppModule(), changeBinds: [ Bind<Dio>((i) => dio), ]);

  test("Must return a usecase without error", (){
    final useCase = Modular.get<ISearchByText>();
    expect(useCase, isA<SearchByText>());
  });

  test("Must return a resultSearch list", ()async{
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: jsonDecode(gitHubResult), statusCode: 200));
    final useCase = Modular.get<ISearchByText>();
    final result = await useCase("rodarte");
    expect(result | null, isA<List<ResultSearch>>());
  });
}