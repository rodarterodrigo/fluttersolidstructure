import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterarquitetureapp/modules/search/domain/usercases/search_by_text.dart';
import 'package:flutterarquitetureapp/modules/search/external/datasources/github_datasource.dart';
import 'package:flutterarquitetureapp/modules/search/infra/repositories/search_repository_impl.dart';

import 'app_widget.dart';

class AppModule extends MainModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => [
    Bind((i) => Dio()),
    Bind((i) => GitHubDataSource(i())),
    Bind((i) => SearchRepository(i())),
    Bind((i) => SearchByText(i())),
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => throw UnimplementedError();

}