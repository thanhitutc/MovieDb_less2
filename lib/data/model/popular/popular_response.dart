import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db/data/model/popular/popular.dart';

part 'popular_response.g.dart';

@JsonSerializable()
class PopularResponse {
  int? page;
  List<Popular>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  int? totalResults;

  PopularResponse({this.page, this.results, this.totalPages, this.totalResults});

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularResponseToJson(this);
}