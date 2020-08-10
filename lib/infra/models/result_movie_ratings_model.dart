import 'dart:convert';

import 'package:arch_example_movies/domain/core/entities/result_movie_details_entity.dart';
import 'package:arch_example_movies/domain/core/entities/result_movie_ratings_entity.dart';

class ResultMoviesRatingsModel extends ResultMoviesRatingsEntity {
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
