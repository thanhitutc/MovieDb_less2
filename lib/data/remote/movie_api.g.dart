// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MovieApi implements MovieApi {
  _MovieApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.themoviedb.org/3/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PopularResponse> getPopular(page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PopularResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    '/movie/popular?api_key=81220b3dccf20362c5451ee74639e4ea',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PopularResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MovieDetailResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options,
                    '/movie/${id}?api_key=81220b3dccf20362c5451ee74639e4ea',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieDetailResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
