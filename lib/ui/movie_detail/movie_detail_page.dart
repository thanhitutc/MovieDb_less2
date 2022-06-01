import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/data/model/movie_detail/movie_detail_response.dart';
import 'package:movie_db/ui/custom/trapezium_clipper.dart';
import 'package:movie_db/ui/movie_detail/movie_detail_viewmodel.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  final int idMovie;

  const MovieDetailPage({Key? key, required this.idMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieDetailViewModel>(context, listen: false)
        .getMovieDetail(idMovie);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Padding(
          padding: EdgeInsets.only(right: 50),
          child: Center(
            child: Text(
              "Detail",
              style: TextStyle(
                  color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        elevation: 0,
      ),
      body:
          Consumer<MovieDetailViewModel>(builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return _MovieDetail(viewModel.getMovieInfo());
        }
      }),
    );
  }

  Widget _MovieDetail(MovieDetailResponse? movie) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              ClipPath(
                clipper: TrapeziumClipper(),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: 225,
                  imageUrl: getImageUrl(movie?.backdropPath),
                  fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset('assets/loading.gif', fit: BoxFit.cover,),
                    errorWidget: (context, url, error) => const Icon(Icons.error)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movie?.title ?? "",
                        maxLines: 1,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis,),
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 20.0,
                      lineWidth: 5.0,
                      percent: movie?.getPercent() ?? 0.0,
                      center: Text("${movie?.voteAverage ?? "0.0"}"),
                      progressColor: Colors.black,
                    )
                  ],
                ),
              ),
              const Divider(color: Colors.black),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'ic_review.png',
                          width: 30,
                          height: 30,
                        ),
                        const Text(
                          "Reviews",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'ic_play.png',
                          width: 30,
                          height: 30,
                        ),
                        const Text(
                          "Trailers",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Genre", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${movie?.getGenres()}",
                            style: const TextStyle(fontSize: 17, color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Release", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movie?.releaseDate??"",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text("${movie?.overview}",style: const TextStyle(color: Colors.black, fontSize: 17),maxLines: 5,overflow: TextOverflow.ellipsis,),
              )
            ],
          ),
          Positioned(
            left: 20,
            top: 50,
            child: CachedNetworkImage(
              width: 130,
              height: 180,
              imageUrl: getImageUrl(movie?.posterPath),
              fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                    height: 16,
                    width: 16,
                    child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                        ))),
                errorWidget: (context, url, error) => const Icon(Icons.error)
            ),
          )
        ],
      ),
    );
  }

  String getImageUrl(String? path) {
    return path != null ? 'https://image.tmdb.org/t/p/w500/$path' : "";
  }
}
