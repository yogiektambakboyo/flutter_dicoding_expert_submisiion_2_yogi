import 'package:cached_network_image/cached_network_image.dart';
import 'package:m_core/m_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_about/m_about.dart';
import 'package:m_core/src/presentation/cubit/tv/tv_series_on_the_air_cbt.dart';
import 'package:m_search/m_search.dart';
import 'package:m_watchlist/m_watchlist.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/tv/tv.dart';
import '../../presentation/cubit/movie/movie_top_rated_cbt.dart';
import '../../presentation/cubit/movie/movie_now_playing_cbt.dart';
import '../../presentation/cubit/movie/movie_popular_cbt.dart';
import '../../presentation/cubit/tv/tv_series_popular_cbt.dart';
import '../../presentation/cubit/tv/tv_series_top_rated_cbt.dart';
import 'movie_detail_page.dart';
import 'popular_movies_page.dart';
import 'top_rated_movies_page.dart';
import '../../presentation/pages/tv_detail_page.dart';
import 'tv_see_more_page.dart';

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage({Key? key}) : super(key: key);

  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> with SingleTickerProviderStateMixin {
  late final TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);

    Future.microtask(() {
      context.read<MovieNowPlayingCbt>().get();
      context.read<MoviePopularCbt>().get();
      context.read<MovieTopRatedCbt>().get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              accountName: Text('Ditonton v1.0.0'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
              child: TabBar(
                controller: _controller,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kOceanBlue,
                ),
                tabs: const [
                  Tab(
                      child: 
                        Text('Movie'),
                        icon: Icon(Icons.movie),
                  ),
                  Tab(
                      child:
                        Text('TV Series'),
                        icon: Icon(Icons.monitor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  controller: _controller,
                  children: const [
                    MovieTabMenu(),
                    TVSeriesTabMenu(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TVSeriesTabMenu extends StatefulWidget {
  const TVSeriesTabMenu({Key? key}) : super(key: key);

  @override
  State<TVSeriesTabMenu> createState() => _TVSeriesTabMenuState();
}

class _TVSeriesTabMenuState extends State<TVSeriesTabMenu> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TVSeriesOnTheAirCbt>().get();
      context.read<TVSeriesTopRatedCbt>().get();
      context.read<TVSeriesPopularCbt>().get();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.play_circle,
                ),
              ),
              Text(
                'On The Air',
                style: kHeading6,
              ),
            ],
          ),
          BlocBuilder<TVSeriesOnTheAirCbt, TVSeriesOnTheAirState>(
            builder: (context, state) {
              if (state is TVSeriesOnTheAirLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is TVSeriesOnTheAirLoaded) {
                return TVList(items: state.items);
              }

              if (state is TVSeriesOnTheAirError) {
                return Center(child: Text(state.message));
              }

              return const SizedBox();
            },
          ),
          BuildSubHeading(
            title: 'Popular',
            onTap: () => Navigator.pushNamed(
              context,
              TVSeeMorePage.ROUTE_NAME,
              arguments: SeeMoreState.Popular,
            ),
            icon: Icons.stars_sharp,
          ),
          BlocBuilder<TVSeriesPopularCbt, TVSeriesPopularState>(
            builder: (context, state) {
              if (state is TVSeriesPopularLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TVSeriesPopularLoadedState) {
                return TVList(items: state.items);
              } else if (state is TVSeriesPopularErrorState) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
          BuildSubHeading(
            title: 'Top Rated',
            onTap: () => Navigator.pushNamed(
              context,
              TVSeeMorePage.ROUTE_NAME,
              arguments: SeeMoreState.TopRated,
            ),
            icon: Icons.stairs_rounded,
          ),
          BlocBuilder<TVSeriesTopRatedCbt, TVSeriesTopRatedState>(
            builder: (context, state) {
              if (state is TVSeriesTopRatedLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TVSeriesTopRatedLoadedState) {
                return TVList(items: state.items);
              } else if (state is TVSeriesTopRatedErrorState) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MovieTabMenu extends StatelessWidget {
  const MovieTabMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.play_circle,
                ),
              ),
              Text(
                'Now Playing',
                style: kHeading6,
              ),
            ],
          ),
          BlocBuilder<MovieNowPlayingCbt, MovieNowPlayingState>(
            builder: (context, state) {
              if (state is MovieNowPlayingLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieNowPlayingLoadedState) {
                return MovieList(movies: state.items);
              } else if (state is MovieNowPlayingErrorState) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
          BuildSubHeading(
            title: 'Popular',
            onTap: () => Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
            icon: Icons.stars_sharp,
          ),
          BlocBuilder<MoviePopularCbt, MoviePopularState>(builder: (context, state) {
            if (state is MoviePopularLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MoviePopularLoadedState) {
              return MovieList(movies: state.items);
            } else if (state is MoviePopularErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          }),
          BuildSubHeading(
            title: 'Top Rated',
            onTap: () => Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
            icon: Icons.stairs_rounded,
          ),
          BlocBuilder<MovieTopRatedCbt, MovieTopRatedState>(builder: (context, state) {
            if (state is MovieTopRatedLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieTopRatedLoadedState) {
              return MovieList(movies: state.items);
            } else if (state is MovieTopRatedErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}

class TVList extends StatelessWidget {
  final List<TV> items;

  const TVList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = items[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TVDetailPage.ROUTE_NAME,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

class BuildSubHeading extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  const BuildSubHeading({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(padding: EdgeInsets.all(3),
              child: Icon(
                icon,
              ),
            ),
            Text(
              title,
              style: kHeading6,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(left : 8,top : 8,right : 8,bottom : 8),
                child: Row(
                  children: const [Text('See More',style: TextStyle(color: Colors.limeAccent, fontStyle: FontStyle.italic),), Icon(Icons.arrow_forward_ios,color: Colors.limeAccent,)],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
