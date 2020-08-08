import 'package:arch_example_movies/domain/core/entities/result_search_by_movie.dart';
import 'package:arch_example_movies/errors/errors_search_movie.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchByMovieController {
  Future<Either<ErrorSearchMovie, List<ResultSearchByMovieEntity>>>
      getResultSearchMovie(String searchedMovie);
}

//tendo a nossa interface, podemos implementar no nosso core;
// de forma para que seja obrigatório o tratamento de algum erro
// na nossa aplicação, usamos o pacote DARTZ que facilitará o nosso
//trabalho

// Como o dartz trabalha:
// onde implementado, ele te obriga a retornar sempre 2 valores
// o primeiro, uma falha e o segundo o conteudo em si
// em linguagem do dartz "esquerda" para erro (exception)
// e "direita" o resultado que voce espera.

// para que a gente tenha mais controle ainda dos nosos erros
// para tratalhos de forma organizada e de acordo com os
// principios solid, criaremos uma pasta erros que
// nomeares de forma correta os nossos erros
// sendo assim, nosso contrato, nao retornará uma expection generica
// retornará um ErrorSearchByMovie com o seu devido tratamento

// de forma mais concentual, isso é bom para que num futuro
// com o escalar da aplicação, voce não dependa de uma coisa
// universal mesmo sendo do flutter
// criando uma class para tratarmos do erro, dependemos de uma classe
// do proprio dominio e não de uma universal
