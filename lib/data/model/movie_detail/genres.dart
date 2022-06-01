import 'package:json_annotation/json_annotation.dart';

part 'genres.g.dart';
@JsonSerializable()
class Genres {
  @JsonKey(name: 'id')int? id;
  @JsonKey(name: 'name')String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) =>
      _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);

}