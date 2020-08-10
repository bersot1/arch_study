import 'dart:math';

import 'package:arch_example_movies/app_module.dart';
import 'package:arch_example_movies/domain/core/controllers/search_by_movie.dart';
import 'package:arch_example_movies/domain/core/entities/result_search_by_movie.dart';
import 'package:arch_example_movies/domain/interface/icontrollers/isearch_by_movie.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  initModule(AppModule());
  // o teste da injeção serve para verificarmos
  // se todo o nosso sismtema esta conectado de forma certa

  test("Deve recuperar o controller sem erro", () async {
    // devemos sempre pegar pela INTERFACE
    // pq sempre dependemos de uma interface
    // e se no futuro precisaremos trocar
    // nao teremos que substituir na view, por example
    // so faremos uma nova implementação
    final controller = Modular.get<ISearchByMovieController>();
    expect(controller, isA<SearchByMovieController>());
  });

  test("Deve trazer uma lista de filmes", () async {
    final controller = Modular.get<ISearchByMovieController>();
    final result = await controller.getResultSearchMovie("Rambo");
    expect(result | null, isA<List<ResultSearchByMovieEntity>>());
  });
}
