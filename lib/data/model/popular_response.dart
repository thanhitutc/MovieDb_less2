class PopularResponese {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  Popular({this.page, this.results, this.totalPages, this.totalResults});

  factory Popular.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}