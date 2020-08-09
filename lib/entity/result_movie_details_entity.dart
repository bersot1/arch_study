import 'result_movie_ratings_entity.dart';

class ResultMovieDetailsEntity {
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  List<ResultMoviesRatings> ratings;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String type;
  String dVD;
  String boxOffice;
  String production;
  String website;
  String response;

  ResultMovieDetailsEntity(
      {this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.ratings,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbID,
      this.type,
      this.dVD,
      this.boxOffice,
      this.production,
      this.website,
      this.response});
}
