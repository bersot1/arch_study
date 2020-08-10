import 'package:arch_example_movies/datasource/interface/imovie_data.dart';
import 'package:arch_example_movies/domain/core/entities/result_movie_details_entity.dart';
import 'package:arch_example_movies/domain/interface/irepositories/imovie_details.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:arch_example_movies/errors/erros_details_movie.dart';

class MovieDetailsRepository implements IMovieDetailsRepository {
  final IMovieData movieData;

  MovieDetailsRepository(this.movieData);

  @override
  Future<Either<ErrorDetailsMovie, ResultMovieDetailsEntity>> getMovieDetails(
      String movieId) async {
    try {
      final result = await movieData.getMovieDetails(movieId);
    } catch (e) {}
  }
}
