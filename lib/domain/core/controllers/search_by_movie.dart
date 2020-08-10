import 'package:arch_example_movies/domain/core/entities/result_search_by_movie.dart';
import 'package:arch_example_movies/domain/interface/icontrollers/isearch_by_movie.dart';
import 'package:arch_example_movies/domain/interface/irepositories/isearch_repository.dart';
import 'package:arch_example_movies/errors/errors_search_movie.dart';
import 'package:dartz/dartz.dart';

// neste aqui começamos a ver a quinto principio do SOLID
// inversão de dependencia
// so podemos depender de uma interface e não de uma implementação
// para isso vamos depender da nossa classe abstrata

class SearchByMovieController implements ISearchByMovieController {
  final ISearchByMovieRepository repository;

  SearchByMovieController(this.repository);

  @override
  Future<Either<ErrorSearchMovie, List<ResultSearchByMovieEntity>>>
      getResultSearchMovie(String searchedMovie) async {
    if (searchedMovie == null) {
      return Left(InvalidTextSearchError());
    }

    return repository.searchMovie(searchedMovie);
  }
}
