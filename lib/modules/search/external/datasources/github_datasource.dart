import 'package:dio/dio.dart';
import 'package:flutterarquitetureapp/modules/search/domain/errors/errors.dart';
import 'package:flutterarquitetureapp/modules/search/infra/datasources/search_datasource.dart';
import 'package:flutterarquitetureapp/modules/search/infra/models/result_search_model.dart';

extension on String{
  normalize(){
    return this.replaceAll(" ", "+");
  }
}

class GitHubDataSource implements SearchDataSource{
  final Dio dio;

  GitHubDataSource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio.get("https://api.github.com/search/users?q=${searchText.normalize()}");
    return response.statusCode == 200? (response.data['items'] as List).map((map) => ResultSearchModel.fromMap(map)).toList(): throw DataSourceError();
  }
}