import 'package:arch_example_movies/domain/interface/irepositories/isearch_repository.dart';
import 'package:arch_example_movies/errors/errors_search_movie.dart';
import 'package:dartz/dartz.dart';
import 'package:arch_example_movies/domain/core/controllers/search_by_movie.dart';
import 'package:arch_example_movies/domain/core/entities/result_search_by_movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// usamos o plugin MOCKITO para facilitar nossa vida nos testes
// ao inves de criarmos uma class abstrata para gente
// o mockito faz isso pela gente

class SearchByMovieRepositoryMock extends Mock
    implements ISearchByMovieRepository {}

main() {
  final repository = SearchByMovieRepositoryMock();

  final searchByMovieController = SearchByMovieController(repository);
  test("Caminho Feliz - deve retornar uma lista de resultSearchByMovie ",
      () async {
    //desse jeito, quando o metodo do repository for chamado
    // se estiver tudo certo ele vai retornar no RIGHT (usando o DARTZ)
    // uma lista de REsultSearchByMovieEntity
    when(repository.searchMovie(any))
        .thenAnswer((_) async => Right(<ResultSearchByMovieEntity>[]));

    final result = await searchByMovieController.getResultSearchMovie("rambo");
    expect(result | null, isA<List<ResultSearchByMovieEntity>>());
  });

  test(
      "Caminho triste - Deve retornar uma InvalidTextError caso o texto seja null",
      () async {
    when(repository.searchMovie(any))
        .thenAnswer((_) async => Right(<ResultSearchByMovieEntity>[]));

    final result = await searchByMovieController.getResultSearchMovie(null);

    expect(result.fold((l) => l, (r) => r), isA<InvalidTextSearchError>());
  });
}
