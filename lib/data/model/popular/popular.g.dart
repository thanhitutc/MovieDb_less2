// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Popular _$PopularFromJson(Map<String, dynamic> json) => Popular(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$PopularToJson(Popular instance) => <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };
