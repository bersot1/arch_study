import 'package:arch_example_movies/app_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'datasource/core/movie_data.dart';
import 'domain/core/controllers/search_by_movie.dart';
import 'infra/repositories/search_movie_repository.dart';

class AppModule extends MainModule {
  //injetando nossas dependeicas
  // usando modular facilitando as coisas
  // precisamos linkar nossas camadas
  // observe que o i ja traz pra gente de forma automatica
  // o que o SearchByMovieController precisa de dependencia
  // sem mt esforços
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => SearchByMovieController(i())),
        Bind((i) => SearchMovieRepository(i())),
        Bind((i) => MovieDataSource(i())),
      ];

  @override
  List<Router> get routers => throw UnimplementedError();

  // aqui ele vai injetar toda nossa view
  @override
  Widget get bootstrap => AppWidget();
}
