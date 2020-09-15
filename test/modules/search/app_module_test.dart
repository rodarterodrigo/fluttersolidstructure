import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarquitetureapp/modules/search/app_module.dart';
import 'package:flutterarquitetureapp/modules/search/domain/entities/result_search.dart';
import 'package:flutterarquitetureapp/modules/search/domain/usercases/search_by_text.dart';
import 'package:mockito/mockito.dart';

main(){

  initModule(AppModule());

  test("Must return a usecase without error", (){
    final useCase = Modular.get<ISearchByText>();
    expect(useCase, isA<SearchByText>());
  });

  test("Must return a resultSearch list", ()async{
    final useCase = Modular.get<ISearchByText>();
    final result = await useCase("rodarte");
    expect(result | null, isA<List<ResultSearch>>());
  });
}