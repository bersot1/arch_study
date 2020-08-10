import 'package:arch_example_movies/domain/core/entities/result_movie_details_entity.dart';
import 'package:arch_example_movies/domain/interface/icontrollers/imovie_details_controller.dart';
import 'package:arch_example_movies/domain/interface/irepositories/imovie_details.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:arch_example_movies/infra/models/result_movie_details_model.dart';
import 'package:arch_example_movies/errors/erros_details_movie.dart';

class MovieDetailsController implements IMovieDetailsController {
  // na interface não precisa ser async

  final IMovieDetailsRepository repository;

  MovieDetailsController(this.repository);

  @override
  Future<Either<ErrorDetailsMovie, ResultMovieDetailsEntity>> getMovieDetails(
      String movieId) async {
    return repository.getMovieDetails(movieId);
  }
}
