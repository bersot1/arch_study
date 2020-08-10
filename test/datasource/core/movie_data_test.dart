import 'dart:convert';

import 'package:arch_example_movies/datasource/core/movie_data.dart';
import 'package:arch_example_movies/errors/errors_search_movie.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/searchMovieAPIResponse.dart';

// para testes devemos testar tudo off
// para isso usamos a implementação do dio num Mock
class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  final datasource = MovieDataSource(dio);

  test("deve retornar uma lista de ResultSearchByMovieModel", () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(searchMovieAPIReponse), statusCode: 200));

    // NEsse caso repare que ele nao retorna um eigter com esquerdo e direito
    // retorna direto uma Future, nesse caso, vamos usar o metodo sincrono
    // depois que acabar tudo, iremos mandar no expect
    final future = datasource.getSearchMovie("rambo");

    // como o tipo aqui nao interessa, vamos usar o completes
    // siginica que se tudo foi certo e trouxe alguma coisa
    // nesse exaplo nao interessa se foi vazio ou nao e vai passar
    expect(future, completes);
  });

  test("deve retornar um erro se o codigo se o cogido nao for 200", () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));

    // NEsse caso repare que ele nao retorna um eigter com esquerdo e direito
    // retorna direto uma Future, nesse caso, vamos usar o metodo sincrono
    // depois que acabar tudo, iremos mandar no expect
    final future = datasource.getSearchMovie("rambo");

    // como o tipo aqui nao interessa, vamos usar o completes
    // siginica que se tudo foi certo e trouxe alguma coisa
    // nesse exaplo nao interessa se foi vazio ou nao e vai passar
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test("deve retornar um erro se tiver um erro no DIO", () async {
    when(dio.get(any)).thenThrow(Exception());

    // NEsse caso repare que ele nao retorna um eigter com esquerdo e direito
    // retorna direto uma Future, nesse caso, vamos usar o metodo sincrono
    // depois que acabar tudo, iremos mandar no expect
    final future = datasource.getSearchMovie("rambo");

    // como o tipo aqui nao interessa, vamos usar o completes
    // siginica que se tudo foi certo e trouxe alguma coisa
    // nesse exaplo nao interessa se foi vazio ou nao e vai passar
    expect(future, throwsA(isA<Exception>()));
  });
}
