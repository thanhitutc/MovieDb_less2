import 'package:dio/dio.dart';
import 'package:movie_db/data/model/popular/popular_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api.g.dart';
const api_key = "81220b3dccf20362c5451ee74639e4ea";

@RestApi(baseUrl: "https://api.themoviedb.org/3/movie/")
abstract class MovieApi {
  factory MovieApi(Dio dio, {String baseUrl}) = _MovieApi;

  @GET("/popular?api_key=$api_key")
  Future<PopularResponse> getPopular(@Query("page") int page);
}
