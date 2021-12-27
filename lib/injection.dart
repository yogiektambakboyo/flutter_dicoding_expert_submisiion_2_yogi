import 'package:m_core/m_core.dart';
import 'package:m_search/m_search.dart';
import 'package:m_watchlist/m_watchlist.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
        () => TVSeriesOnTheAirCbt(
      getOnTheAirTVSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TVSeriesDetailCbt(
      getDetailTVSeries: locator(),
      getWatchListStatusTVSeries: locator(),
      saveWatchlistTVSeries: locator(),
      removeWatchlistTVSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TVSeriesRecommendationsCbt(
      getRecommendationTVSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TVSeriesSearchCbt(
      searchTVSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TVSeriesTopRatedCbt(
      getTopRatedTVSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TVSeriesPopularCbt(
      getPopularTVSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TVSeriesWatchlistCbt(
      getWatchlistTVSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TVSeriesEpisodeSeasonCbt(
      getEpisodeSeasonTVSeries: locator(),
    ),
  );

  ///! END TV SERIES
  ///! START MOVIES SERIES CUBIT
  locator.registerFactory(
    () => MovieSearchCbt(
      searchMovies: locator(),
    ),
  );

  locator.registerFactory(
    () => MovieWatchlistCbt(
      getWatchlistMovies: locator(),
    ),
  );

  locator.registerFactory(
    () => MovieNowPlayingCbt(
      getNowPlayingMovies: locator(),
    ),
  );

  locator.registerFactory(
    () => MoviePopularCbt(
      getPopularMovies: locator(),
    ),
  );

  locator.registerFactory(
    () => MovieTopRatedCbt(
      getTopRatedMovies: locator(),
    ),
  );

  locator.registerFactory(
    () => MovieRecommendationsCbt(
      getMovieRecommendations: locator(),
    ),
  );

  locator.registerFactory(
    () => MovieDetailCbt(
      getMovieDetail: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
      getWatchListStatus: locator(),
    ),
  );

  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  locator.registerLazySingleton(() => GetOnTheAirTVSeries(repository: locator()));
  locator.registerLazySingleton(() => GetDetailTVSeries(repository: locator()));
  locator.registerLazySingleton(() => GetPopularTVSeries(repository: locator()));
  locator.registerLazySingleton(() => GetTopRatedTVSeries(repository: locator()));
  locator.registerLazySingleton(() => SearchTVSeries(repository: locator()));
  locator.registerLazySingleton(() => GetRecommendationTVSeries(repository: locator()));
  locator.registerLazySingleton(() => GetEpisodeSeasonTVSeries(repository: locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTVSeries(repository: locator()));
  locator.registerLazySingleton(() => GetWatchlistTVSeries(repository: locator()));
  locator.registerLazySingleton(() => SaveWatchlistTVSeries(repository: locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTVSeries(repository: locator()));

  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<TVRepository>(
    () => TVRepositoryImpl(
      tvRemoteDataSource: locator(),
      tvLocalDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );

  locator.registerLazySingleton<TVRemoteDataSource>(
    () => TVRemoteDataSourceImp(
      client: locator(),
    ),
  );

  locator.registerLazySingleton<TVLocalDataSource>(
    () => TVLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );

  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  locator.registerLazySingleton(() => HttpSSLPinning.client);
}
