import 'package:movie_db/data/model/popular/popular.dart';

import 'model/movie_detail/movie_detail_response.dart';

abstract class MovieRepository {
  Future<List<Popular>> getPopular(int page);

  Future<MovieDetailResponse?> getMovieDetail(int idMovie);
}