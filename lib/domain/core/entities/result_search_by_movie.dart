// A entidade deve ser a mais pura possivel
// "mais pura" significa que nao deverá contar coisas externas a essa entidade
// apenas um modelo anemico
// ou seja, nessa entidade, não entra os mappers, que são os fromJsone e to Tojsons
// porque isso nessa entdade, não é responsáblidade dessa classe.

class ResultSearchByMovieEntity {
  final String title;
  final String year;
  final String imbdID;
  final String poster;

  ResultSearchByMovieEntity({
    this.title,
    this.year,
    this.imbdID,
    this.poster,
  });
}
