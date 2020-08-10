import 'package:arch_example_movies/app_module.dart';
import 'package:arch_example_movies/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
  ));
}
