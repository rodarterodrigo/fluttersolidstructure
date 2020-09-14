import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarquitetureapp/modules/search/domain/errors/errors.dart';
import 'package:flutterarquitetureapp/modules/search/external/datasources/github_datasource.dart';
import 'package:mockito/mockito.dart';
import '../utils/github_response.dart';

class DioMock extends Mock implements Dio{

}

main(){

  final dio = DioMock();
  final datasource = GitHubDataSource(dio);

  test("Must return a ResultSearchModel list", () async {
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: jsonDecode(gitHubResult), statusCode: 200));
    final future = datasource.getSearch("searchText");
    expect(future, completes);
  });

  test("Must return a Exception when the code isn't 200", () async {
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: null, statusCode: 401));
    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<DataSourceError>()));
  });

  test("Must return a Exception when the code isn't 200", () async {
    when(dio.get(any)).thenThrow(Exception());
    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<Exception>()));
  });
}