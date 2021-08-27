import 'package:api_project/controllers/movie_controller.dart';
import 'package:api_project/models/movie_model.dart';
import 'package:api_project/pages/homePage/widgets/content_list.dart';
import 'package:flutter/material.dart';

import 'widgets/content_header.dart';
import 'widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = MovieController();
  final List<MovieModel> _controllerPopularity = [];
  final List<MovieModel> _recentsMovies = [];
  final List<MovieModel> _horrorMoviesList = [];
  final _scrollController = ScrollController();

  double _scrollOffset = 0.0;
  int lastPage = 1;

  @override
  void initState() {
    super.initState();
    //_initScrollListener();
    _scrollController
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    _initialize();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // _initScrollListener() {
  //   _scrollController
  //     ..addListener(() async {
  //       setState(() {
  //         _scrollOffset = _scrollController.offset;
  //       });
  //       print(_scrollOffset);
  //
  //       if (_scrollController.offset >=
  //           _scrollController.position.maxScrollExtent) {
  //         if (_controller.currentPage == lastPage) {
  //           lastPage++;
  //           await _controller.fetchAllMovies(page: lastPage);
  //           setState(() {});
  //         }
  //       }
  //     });
  // }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });
    await _controller.fetchAllMovies(page: lastPage); // request first 20 movies
    await _controller.fetchAllMovies(
        page: lastPage + 1); // request more 20 movies
    _popularMovies();
    _recentMovies();
    _horrorMovies();

    setState(() {});
    print(_controller.movies.length);

    setState(() {
      _controller.loading = false;
    });
  }

  void _popularMovies() {
    _controller.movies.forEach((movie) {
      if (movie.voteAverage >= 8) {
        _controllerPopularity.add(movie);
      }
    });

    print('populares ' + _controllerPopularity.length.toString());
  }

  void _recentMovies() {
    _controller.movies.forEach((movie) {
      if (movie.releaseDate.isAfter(DateTime(2021, 8, 1))) {
        _recentsMovies.add(movie);
      }
    });

    print('recentes ' + _recentsMovies.length.toString());
  }

  void _horrorMovies() {
    _controller.movies.forEach((movie) {
      if (movie.genreIds.contains(27)) {
        _horrorMoviesList.add(movie);
      }
    });

    print('filme de horror ' + _horrorMoviesList.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      backgroundColor: Colors.black,
      body: _controller.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                    child: ContentHeader(
                        title: _controller.movies[0].title,
                        posterPath: _controller.movies[0].posterPath)),
                SliverToBoxAdapter(
                    child: ContentList(
                  label: 'Populares na Netflix',
                  contentList: _controllerPopularity,
                )),
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverToBoxAdapter(
                      child: ContentList(
                    label: 'Recentes',
                    contentList: _recentsMovies,
                  )),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 20.0),
                  sliver: SliverToBoxAdapter(
                      child: ContentList(
                    label: 'Filmes de terror',
                    contentList: _horrorMoviesList,
                  )),
                ),
                SliverToBoxAdapter(
                    child: Container(
                  height: 80,
                )),
              ],
            ),
    );
  }
}
