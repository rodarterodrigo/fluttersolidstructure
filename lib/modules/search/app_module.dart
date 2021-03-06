import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterarquitetureapp/modules/search/external/datasources/github_datasource.dart';
import 'package:flutterarquitetureapp/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutterarquitetureapp/modules/search/presenter/search/search_bloc.dart';
import 'package:flutterarquitetureapp/modules/search/presenter/search/search_page.dart';

import 'app_widget.dart';
import 'domain/usecases/search_by_text.dart';

class AppModule extends MainModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => [
    Bind((i) => Dio()),
    Bind((i) => GitHubDataSource(i())),
    Bind((i) => SearchRepository(i())),
    Bind((i) => SearchByText(i())),
    Bind((i) => SearchBloc(i())),
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (x, y) => SearchPage()),
  ];
}