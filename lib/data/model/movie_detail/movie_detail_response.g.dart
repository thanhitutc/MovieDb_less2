// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailResponse _$MovieDetailResponseFromJson(Map<String, dynamic> json) =>
    MovieDetailResponse(
      json['backdrop_path'] as String?,
      (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int?,
      json['overview'] as String?,
      json['poster_path'] as String?,
      json['release_date'] as String?,
      json['title'] as String?,
      (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieDetailResponseToJson(
        MovieDetailResponse instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'genres': instance.genres,
      'id': instance.id,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
