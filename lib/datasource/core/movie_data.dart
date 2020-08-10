import 'package:arch_example_movies/config.dart';
import 'package:arch_example_movies/datasource/interface/imovie_data.dart';
import 'package:arch_example_movies/errors/errors_search_movie.dart';
import 'package:arch_example_movies/infra/models/result_movie_details_model.dart';
import 'package:arch_example_movies/infra/models/result_search_by_movie_models.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

extension on String {
  normalize() {
    return this.replaceAll(" ", "+");
  }
}

class MovieDataSource implements IMovieData {
  final Dio dio;

  MovieDataSource(this.dio);

  @override
  Future<List<ResultSearchByMovieModel>> getSearchMovie(
      String searchedMovie) async {
    var urlPath =
        Settings.urlApiDev + "&s=" + searchedMovie.normalize() + "&type=movie";
    final response = await dio.get(urlPath);

    if (response.statusCode == 200) {
      final list = (response.data['Search'] as List)
          .map((e) => ResultSearchByMovieModel.fromMap(e))
          .toList();

      return list;
    } else {
      // se for um erro desconhecido, não precisamos usar try catch
      // porque no nosso repository ja estamos tratando isso

      throw DatasourceError();
    }
  }

  @override
  Future<ResultMovieDetailsModel> getMovieDetails(String movieId) async {
    var urlPath = Settings.urlApiDev + "i=" + movieId;

    final response = await dio.get(urlPath);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.data);

      ResultMovieDetailsModel result =
          new ResultMovieDetailsModel.fromJson(jsonResponse);

      return result;
    } else {
      throw DatasourceError();
    }
  }
}
