import 'package:arch_example_movies/datasource/core/movie_data.dart';
import 'package:arch_example_movies/errors/errors_search_movie.dart';
import 'package:arch_example_movies/infra/models/result_search_by_movie_models.dart';
import 'package:arch_example_movies/infra/repositories/search_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MovieDatasourceMock extends Mock implements MovieDataSource {}

main() {
  final datasource = MovieDatasourceMock();

  final repository = SearchMovieRepository(datasource);

  test("deve retornar uma lista de ResultSearchByMovieEntity", () async {
    when(datasource.getSearchMovie(any))
        .thenAnswer((_) async => <ResultSearchByMovieModel>[]);
    //como ja testamos se vai vazio ou nao no nosso controler, nao precisamos testar aqui novamente
    final result = await repository.searchMovie("rambo");

    expect(result | null, isA<List<ResultSearchByMovieModel>>());
  });

  test("deve retornar uma erro se o dataSource falhar", () async {
    when(datasource.getSearchMovie(any)).thenThrow(Exception());

    // como o erro vem de fora, a gente não tem como esperar nada...
    // então vamos retornar uma exception e se capturarmos uma exception
    // vamos trata-la

    final result = await repository.searchMovie("rambo");

    expect(result.fold((l) => l, (r) => r), isA<DatasourceError>());
  });
}
