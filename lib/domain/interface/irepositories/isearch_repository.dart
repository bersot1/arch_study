import 'package:arch_example_movies/domain/core/entities/result_search_by_movie.dart';
import 'package:arch_example_movies/errors/errors_search_movie.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchByMovieRepository {
  Future<Either<ErrorSearchMovie, List<ResultSearchByMovieEntity>>> searchMovie(
      String searchMovie);
}
