import 'package:arch_example_movies/domain/core/controllers/movie_details_controller.dart';
import 'package:arch_example_movies/domain/core/entities/result_movie_details_entity.dart';
import 'package:arch_example_movies/domain/interface/icontrollers/imovie_details_controller.dart';
import 'package:arch_example_movies/domain/interface/irepositories/imovie_details.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class IMovieDetailsRepositoryMock extends Mock
    implements IMovieDetailsRepository {}

main() {
  final repository = IMovieDetailsRepositoryMock();
  final controller = MovieDetailsController(repository);

  test("Deve retornar um objeto de ResultMovieDetails", () async {
    when(repository.getMovieDetails(any))
        .thenAnswer((_) async => Right(ResultMovieDetailsEntity()));

    final result = await controller.getMovieDetails("tt0462499");

    expect(result | null, isA<ResultMovieDetailsEntity>());
  });
}
