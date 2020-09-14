import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterarquitetureapp/modules/search/app_module.dart';

import 'modules/search/app_widget.dart';

void main() {
  runApp(ModularApp(module: AppModule(),));
}