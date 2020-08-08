import 'package:arch_example_movies/infra/models/result_movie_details_model.dart';
import 'package:arch_example_movies/infra/models/result_search_by_movie_models.dart';

abstract class IMovieData {
  Future<List<ResultSearchByMovieModel>> getSearchMovie(String searchedMovie);

  Future<List<ResultMovieDetailsModel>> getMovieDetails(String movieId);
}
