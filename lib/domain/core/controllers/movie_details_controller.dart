import 'package:arch_example_movies/domain/core/entities/result_movie_details_entity.dart';
import 'package:arch_example_movies/domain/interface/icontrollers/imovie_details_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:arch_example_movies/errors/erros_details_movie.dart';

class MovieDetailsController implements IMovieDetailsController {
  @override
  Future<Either<ErrorDetailsMovie, List<ResultMovieDetailsEntity>>>
      getMovieDetails(String movieId) {}
}
