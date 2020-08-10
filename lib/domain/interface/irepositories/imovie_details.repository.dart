import 'package:arch_example_movies/domain/core/entities/result_movie_details_entity.dart';
import 'package:arch_example_movies/errors/erros_details_movie.dart';
import 'package:dartz/dartz.dart';

abstract class IMovieDetailsRepository {
  Future<Either<ErrorDetailsMovie, ResultMovieDetailsEntity>> getMovieDetails(
      String movieId);
}
