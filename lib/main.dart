import 'package:m_about/m_about.dart';
import 'package:m_core/m_core.dart';
import 'package:m_search/m_search.dart';
import 'package:m_watchlist/m_watchlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import './injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HttpSSLPinning.init();
  await initializeDateFormatting();
  //FirebaseCrashlytics.instance.crash();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<TVSeriesOnTheAirCbt>(
          create: (context) => di.locator<TVSeriesOnTheAirCbt>(),
        ),
        BlocProvider<TVSeriesDetailCbt>(
          create: (context) => di.locator<TVSeriesDetailCbt>(),
        ),
        BlocProvider<TVSeriesRecommendationsCbt>(
          create: (context) => di.locator<TVSeriesRecommendationsCbt>(),
        ),
        BlocProvider<TVSeriesSearchCbt>(
          create: (context) => di.locator<TVSeriesSearchCbt>(),
        ),
        BlocProvider<TVSeriesTopRatedCbt>(
          create: (context) => di.locator<TVSeriesTopRatedCbt>(),
        ),
        BlocProvider<TVSeriesPopularCbt>(
          create: (context) => di.locator<TVSeriesPopularCbt>(),
        ),
        BlocProvider<TVSeriesWatchlistCbt>(
          create: (context) => di.locator<TVSeriesWatchlistCbt>(),
        ),
        BlocProvider<TVSeriesEpisodeSeasonCbt>(
          create: (context) => di.locator<TVSeriesEpisodeSeasonCbt>(),
        ),

        BlocProvider<MovieSearchCbt>(
          create: (context) => di.locator<MovieSearchCbt>(),
        ),
        BlocProvider<MovieWatchlistCbt>(
          create: (context) => di.locator<MovieWatchlistCbt>(),
        ),
        BlocProvider<MovieNowPlayingCbt>(
          create: (context) => di.locator<MovieNowPlayingCbt>(),
        ),
        BlocProvider<MoviePopularCbt>(
          create: (context) => di.locator<MoviePopularCbt>(),
        ),
        BlocProvider<MovieTopRatedCbt>(
          create: (context) => di.locator<MovieTopRatedCbt>(),
        ),
        BlocProvider<MovieRecommendationsCbt>(
          create: (context) => di.locator<MovieRecommendationsCbt>(),
        ),
        BlocProvider<MovieDetailCbt>(
          create: (context) => di.locator<MovieDetailCbt>(),
        ),

      ],
      child: MaterialApp(
        title: 'Ditonton',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: kYoungPurple,
          scaffoldBackgroundColor: kYoungPurple,
          textTheme: kTextTheme, colorScheme: kColorScheme.copyWith(secondary: kOceanBlue),
        ),
        home: HomeMoviePage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());

            case TVDetailPage.ROUTE_NAME:
              final int id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (context) => TVDetailPage(id: id),
              );
            case TVSeeMorePage.ROUTE_NAME:
              final SeeMoreState state = settings.arguments as SeeMoreState;
              return MaterialPageRoute(
                builder: (context) => TVSeeMorePage(seeMoreState: state),
              );
            case TVEpisodeSeasonPage.ROUTE_NAME:
              final param = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                builder: (context) => TVEpisodeSeasonPage(param: param),
              );

            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
