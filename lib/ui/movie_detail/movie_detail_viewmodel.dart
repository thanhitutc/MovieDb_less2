import 'package:flutter/material.dart';
import 'package:movie_db/data/movie_repository.dart';

import '../../data/model/movie_detail/movie_detail_response.dart';

class MovieDetailViewModel extends ChangeNotifier {
  final MovieRepository repository;
  MovieDetailResponse? _movieDetailResponse;
  bool isLoading = false;

  MovieDetailViewModel(this.repository);

  Future<void> getMovieDetail(int idMovie) async {
    isLoading = true;
    _movieDetailResponse = await repository.getMovieDetail(idMovie);
    print("thanh_detail: ${_movieDetailResponse?.toString()}");
    isLoading = false;
    notifyListeners();
  }

  MovieDetailResponse? getMovieInfo() {
    return _movieDetailResponse;
  }
}