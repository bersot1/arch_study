import 'dart:convert';

class ResultMoviesRatingsModel {
  String source;
  String value;

  ResultMoviesRatingsModel({this.source, this.value});

  Map<String, dynamic> toMap() {
    return {
      'source': source,
      'value': value,
    };
  }

  factory ResultMoviesRatingsModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultMoviesRatingsModel(
      source: map['source'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultMoviesRatingsModel.fromJson(String source) =>
      ResultMoviesRatingsModel.fromMap(json.decode(source));
}
