import 'package:movie_db/data/model/movie_detail/movie_detail_response.dart';
import 'package:movie_db/data/model/popular/popular.dart';
import 'package:movie_db/data/movie_repository.dart';
import 'package:movie_db/data/remote/movie_api.dart';

class MovieRepositoryImp extends MovieRepository {
  String apiKey = "95341c1f0891ae7cf8e1cd430f463248";
  final MovieApi movieApi;

  MovieRepositoryImp(this.movieApi);

  @override
  Future<List<Popular>> getPopular(int page) async {
    try {
      final response = await movieApi.getPopular(page);
      final populars = response.results ?? [];
      return populars;
    } on Exception catch (e) {
      return [];
    }
  }

  @override
  Future<MovieDetailResponse?> getMovieDetail(int idMovie) async {
    try {
      final response = await movieApi.getMovieDetail(idMovie);
      return response;
    } on Exception catch (e) {
      print("getMovieDetail Error: $e");
      return null;
    }
  }



}
