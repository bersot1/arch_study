import 'package:arch_example_movies/datasource/interface/imovie_data.dart';
import 'package:arch_example_movies/domain/core/entities/result_search_by_movie.dart';
import 'package:arch_example_movies/domain/interface/irepositories/isearch_repository.dart';
import 'package:arch_example_movies/errors/errors_search_movie.dart';
import 'package:dartz/dartz.dart';

class SearchMovieRepository implements ISearchByMovieRepository {
  final IMovieData movieData;

  SearchMovieRepository(this.movieData);

  @override
  Future<Either<ErrorSearchMovie, List<ResultSearchByMovieEntity>>> searchMovie(
      String searchMovie) async {
    try {
      final result = await movieData.getSearchMovie(searchMovie);

      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
