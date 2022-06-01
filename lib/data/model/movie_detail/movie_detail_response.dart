import 'dart:math';
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'genres.dart';

part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse {
  @JsonKey(name: 'backdrop_path') String? backdropPath;
  @JsonKey(name: 'genres') List<Genres>? genres;
  int? id;
  @JsonKey(name: 'overview') String? overview;
  @JsonKey(name: 'poster_path') String? posterPath;
  @JsonKey(name: 'release_date')String? releaseDate;
  @JsonKey(name: 'title')String? title;
  @JsonKey(name: 'vote_average')double? voteAverage;

  MovieDetailResponse(this.backdropPath, this.genres, this.id, this.overview,
      this.posterPath, this.releaseDate, this.title, this.voteAverage);


  @override
  String toString() {
    return "title: $title - backdrop_path: $backdropPath - overview: $overview "
        "- releaseDate: $releaseDate - vote: $voteAverage - genres: $genres";
  }

  double getPercent()
  {
     if (voteAverage == null) {
       return 0.0;
     } else{
       return voteAverage! / 10;
     }
  }

  String getGenres() {
    String result = "";
    genres?.forEachIndexed((index, element) {
      result += element.name ?? "";
      if(index < genres!.length -1) {
        result += ", ";
      }
    });
    return result;
  }

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}
