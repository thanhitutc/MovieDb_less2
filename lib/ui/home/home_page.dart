import 'package:flutter/material.dart';
import 'package:movie_db/ui/home/home_viewmodel.dart';
import 'package:movie_db/ui/home/listview/popular_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
  
}


class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Provider.of<HomeViewModel>(context, listen: false).loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeViewModel>(context, listen: false).getPopular();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Align(
            child: Text(
              "Popular",
              style: TextStyle(
                  color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          elevation: 0,
        ),
        body: SafeArea (
        child: Consumer<HomeViewModel>(builder: (context, viewModel, child) {
          return _buildList(viewModel);
        }),
        )
    );
  }

  Widget _buildList(HomeViewModel homeViewModel) {
    return RefreshIndicator(
      onRefresh: () async {
        return homeViewModel.pullToRefresh();
      },
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: homeViewModel.getSize(),
                  itemBuilder: (context, index) {
                    if (homeViewModel.getList().length - 1  == index) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return PopularItem(movie: homeViewModel.getList()[index]);
                    }
                  },
                ),
              ),
            ],
          ),
          if (homeViewModel.isLoadMore)
            const Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}
