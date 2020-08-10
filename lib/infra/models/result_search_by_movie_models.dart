import 'dart:convert';

import 'package:arch_example_movies/domain/core/entities/result_search_by_movie.dart';

class ResultSearchByMovieModel extends ResultSearchByMovieEntity {
  final String title;
  final String year;
  final String imbdID;
  final String poster;
  ResultSearchByMovieModel({
    this.title,
    this.year,
    this.imbdID,
    this.poster,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'year': year,
      'imbdID': imbdID,
      'poster': poster,
    };
  }

  factory ResultSearchByMovieModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultSearchByMovieModel(
      title: map['title'],
      year: map['year'],
      imbdID: map['imbdID'],
      poster: map['poster'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchByMovieModel.fromJson(String source) =>
      ResultSearchByMovieModel.fromMap(json.decode(source));
}
