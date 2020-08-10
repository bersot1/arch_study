abstract class ErrorSearchMovie implements Exception {}

class InvalidTextSearchError implements ErrorSearchMovie {}

class DatasourceError implements ErrorSearchMovie {
  final String message;

  DatasourceError({this.message});
}
