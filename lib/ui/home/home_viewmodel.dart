import 'package:flutter/material.dart';
import 'package:movie_db/data/movie_repository.dart';

import '../../data/model/popular/popular.dart';

class HomeViewModel extends ChangeNotifier {
  final MovieRepository repository;
  List<Popular> _populars = [];
  int _page = 1;
  bool isLoading = false;
  bool isLoadMore = false;
  HomeViewModel(this.repository);


  Future<void> getPopular({bool loading= true, int page = 1}) async {
    isLoading = loading;
    _page = page;
    final result = await repository.getPopular(page);
    if (result.isEmpty) {
      //
    } else {
      _populars.addAll(result);
    }
    isLoading = false;
    isLoadMore = false;
    print("Popular: ${_populars.length}");
    notifyListeners();
  }

  void pullToRefresh() async{
    _populars.clear();
    await getPopular(loading: false, page: 1);
  }

  void loadMore() async {
    isLoadMore = true;
    _page++;
    await getPopular(loading: false, page: _page);
    notifyListeners();
  }

  int getSize() {
    return _populars.length;
  }

  List<Popular> getList() {
    return _populars;
  }

}