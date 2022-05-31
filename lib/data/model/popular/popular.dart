import 'package:json_annotation/json_annotation.dart';

part 'popular.g.dart';

@JsonSerializable()
class Popular {
  int? id;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  String? title;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  Popular({
        this.backdropPath,
        this.id,
        this.overview,
        this.posterPath,
        this.title});

  factory Popular.fromJson(Map<String, dynamic> json) =>
      _$PopularFromJson(json);

  Map<String, dynamic> toJson() => _$PopularToJson(this);
}