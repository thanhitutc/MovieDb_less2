import 'package:movie_db/data/model/popular/popular.dart';

abstract class MovieRepository {
  Future<List<Popular>> getPopular(int page);
}