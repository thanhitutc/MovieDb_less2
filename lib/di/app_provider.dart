import 'package:dio/dio.dart' as dio;
import 'package:movie_db/data/movie_repository_imp.dart';
import 'package:movie_db/data/remote/movie_api.dart';
import 'package:movie_db/ui/home/home_viewmodel.dart';
import 'package:movie_db/ui/movie_detail/movie_detail_viewmodel.dart';
import 'package:provider/provider.dart';

final _movieApiProvider = Provider(create: (_) => MovieApi(dio.Dio(dio.BaseOptions(contentType: "application/json"))));

final _repositoryProvider =
    Provider<MovieRepositoryImp>(create: (context) => MovieRepositoryImp(
        context.read<MovieApi>()
    ));

final _homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(context.read<MovieRepositoryImp>()));

final _movieDetailViewModelProvider = ChangeNotifierProvider<MovieDetailViewModel>(
    create: (context) => MovieDetailViewModel(context.read<MovieRepositoryImp>()));

final appProviders = [_movieApiProvider, _repositoryProvider, _homeViewModelProvider, _movieDetailViewModelProvider];
