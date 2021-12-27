// Mocks generated by Mockito 5.0.16 from annotations
// in core/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:convert' as _i17;
import 'dart:typed_data' as _i18;

import 'package:m_core/m_core.dart' as _i6;
import 'package:m_core/src/data/models/movie_detail_model.dart' as _i3;
import 'package:m_core/src/data/models/movie_model.dart' as _i9;
import 'package:m_core/src/data/models/movie_table.dart' as _i10;
import 'package:m_core/src/data/models/tv/tv_detail_model.dart' as _i4;
import 'package:m_core/src/data/models/tv/tv_episode_model.dart'
    as _i14;
import 'package:m_core/src/data/models/tv/tv_local_database_model.dart'
    as _i15;
import 'package:m_core/src/data/models/tv/tv_model.dart' as _i13;
import 'package:m_core/src/domain/entities/movie_detail.dart' as _i8;
import 'package:m_core/src/domain/entities/tv/tv_detail.dart' as _i11;
import 'package:m_core/src/domain/entities/tv/tv_episode.dart' as _i12;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i16;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeMovieDetailResponse_1 extends _i1.Fake
    implements _i3.MovieDetailResponse {}

class _FakeTVDetailResponse_2 extends _i1.Fake implements _i4.TVDetailResponse {
}

class _FakeResponse_3 extends _i1.Fake implements _i5.Response {}

class _FakeStreamedResponse_4 extends _i1.Fake implements _i5.StreamedResponse {
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i6.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, _i8.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
          returnValue: Future<_i2.Either<_i6.Failure, _i8.MovieDetail>>.value(
              _FakeEither_0<_i6.Failure, _i8.MovieDetail>())) as _i7
          .Future<_i2.Either<_i6.Failure, _i8.MovieDetail>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, String>> saveWatchlist(
          _i8.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i7.Future<_i2.Either<_i6.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, String>> removeWatchlist(
          _i8.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i7.Future<_i2.Either<_i6.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i6.Movie>>())) as _i7
          .Future<_i2.Either<_i6.Failure, List<_i6.Movie>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i6.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i9.MovieModel>> getNowPlayingMovies() => (super.noSuchMethod(
          Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<List<_i9.MovieModel>>.value(<_i9.MovieModel>[]))
      as _i7.Future<List<_i9.MovieModel>>);
  @override
  _i7.Future<List<_i9.MovieModel>> getPopularMovies() => (super.noSuchMethod(
          Invocation.method(#getPopularMovies, []),
          returnValue: Future<List<_i9.MovieModel>>.value(<_i9.MovieModel>[]))
      as _i7.Future<List<_i9.MovieModel>>);
  @override
  _i7.Future<List<_i9.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
          Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<List<_i9.MovieModel>>.value(<_i9.MovieModel>[]))
      as _i7.Future<List<_i9.MovieModel>>);
  @override
  _i7.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue: Future<_i3.MovieDetailResponse>.value(
                  _FakeMovieDetailResponse_1()))
          as _i7.Future<_i3.MovieDetailResponse>);
  @override
  _i7.Future<List<_i9.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  Future<List<_i9.MovieModel>>.value(<_i9.MovieModel>[]))
          as _i7.Future<List<_i9.MovieModel>>);
  @override
  _i7.Future<List<_i9.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  Future<List<_i9.MovieModel>>.value(<_i9.MovieModel>[]))
          as _i7.Future<List<_i9.MovieModel>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i6.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i10.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlist(_i10.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i10.MovieTable?> getDataById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDataById, [id]),
              returnValue: Future<_i10.MovieTable?>.value())
          as _i7.Future<_i10.MovieTable?>);
  @override
  _i7.Future<List<_i10.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
          Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<List<_i10.MovieTable>>.value(<_i10.MovieTable>[]))
      as _i7.Future<List<_i10.MovieTable>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TVRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVRepository extends _i1.Mock implements _i6.TVRepository {
  MockTVRepository() {
    _i1.throwOnMissingStub(this);
  }
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>> getPopularTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularTVSeries, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i6.TV>>>.value(
              _FakeEither_0<_i6.Failure, List<_i6.TV>>()))
      as _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>> getOnTheAirTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getnTheAirTVSeries, []),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i6.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i6.TV>>()))
          as _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>> getTopRatedTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTVSeries, []),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i6.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i6.TV>>()))
          as _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>> getRecommendationTVSeries(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getRecommendationTVSeries, [id]),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i6.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i6.TV>>()))
          as _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, _i11.TVDetail>> getDetailTVSeries(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTVSeries, [id]),
              returnValue: Future<_i2.Either<_i6.Failure, _i11.TVDetail>>.value(
                  _FakeEither_0<_i6.Failure, _i11.TVDetail>()))
          as _i7.Future<_i2.Either<_i6.Failure, _i11.TVDetail>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>> searchTVSeries(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVSeries, [query]),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i6.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i6.TV>>()))
          as _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i12.Episode>>>
      getEpisodeSeasonTVSeries({int? id, int? seasonNumber}) => (super
              .noSuchMethod(
                  Invocation.method(
                      #getEpisodeSeasonTVSeries, [], {
                    #id: id,
                    #seasonNumber: seasonNumber
                  }),
                  returnValue:
                      Future<_i2.Either<_i6.Failure, List<_i12.Episode>>>.value(
                          _FakeEither_0<_i6.Failure, List<_i12.Episode>>()))
          as _i7.Future<_i2.Either<_i6.Failure, List<_i12.Episode>>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, String>> insertWatchlistTVSeries(
          _i11.TVDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTVSeries, [tv]),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i7.Future<_i2.Either<_i6.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, String>> removeWatchlistTVSeries(
          _i11.TVDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTVSeries, [tv]),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i7.Future<_i2.Either<_i6.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlistTVSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTVSeries, [id]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>> getWatchlistTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTVSeries, []),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i6.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i6.TV>>()))
          as _i7.Future<_i2.Either<_i6.Failure, List<_i6.TV>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TVRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVRemoteDataSource extends _i1.Mock
    implements _i6.TVRemoteDataSource {
  MockTVRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i13.TVModel>> getOnTheAirTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getOnTheAirTVSeries, []),
              returnValue: Future<List<_i13.TVModel>>.value(<_i13.TVModel>[]))
          as _i7.Future<List<_i13.TVModel>>);
  @override
  _i7.Future<List<_i13.TVModel>> getPopularTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularTVSeries, []),
              returnValue: Future<List<_i13.TVModel>>.value(<_i13.TVModel>[]))
          as _i7.Future<List<_i13.TVModel>>);
  @override
  _i7.Future<List<_i13.TVModel>> getTopRatedTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTVSeries, []),
              returnValue: Future<List<_i13.TVModel>>.value(<_i13.TVModel>[]))
          as _i7.Future<List<_i13.TVModel>>);
  @override
  _i7.Future<List<_i13.TVModel>> getRecommendationTVSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#getRecommendationTVSeries, [id]),
              returnValue: Future<List<_i13.TVModel>>.value(<_i13.TVModel>[]))
          as _i7.Future<List<_i13.TVModel>>);
  @override
  _i7.Future<_i4.TVDetailResponse> getDetailTVSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTVSeries, [id]),
              returnValue:
                  Future<_i4.TVDetailResponse>.value(_FakeTVDetailResponse_2()))
          as _i7.Future<_i4.TVDetailResponse>);
  @override
  _i7.Future<List<_i13.TVModel>> searchTVSeries(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVSeries, [query]),
              returnValue: Future<List<_i13.TVModel>>.value(<_i13.TVModel>[]))
          as _i7.Future<List<_i13.TVModel>>);
  @override
  _i7.Future<List<_i14.EpisodeModel>> getEpisodeSeasonTVSeries(
          {int? id, int? seasonNumber}) =>
      (super.noSuchMethod(
              Invocation.method(#getEpisodeSeasonTVSeries, [],
                  {#id: id, #seasonNumber: seasonNumber}),
              returnValue:
                  Future<List<_i14.EpisodeModel>>.value(<_i14.EpisodeModel>[]))
          as _i7.Future<List<_i14.EpisodeModel>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TVLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVLocalDataSource extends _i1.Mock implements _i6.TVLocalDataSource {
  MockTVLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i15.TVLocalDatabaseModel? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [tv]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlist(_i15.TVLocalDatabaseModel? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [tv]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i15.TVLocalDatabaseModel?> getDataById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDataById, [id]),
              returnValue: Future<_i15.TVLocalDatabaseModel?>.value())
          as _i7.Future<_i15.TVLocalDatabaseModel?>);
  @override
  _i7.Future<List<_i15.TVLocalDatabaseModel>> getWatchlist() =>
      (super.noSuchMethod(Invocation.method(#getWatchlist, []),
              returnValue: Future<List<_i15.TVLocalDatabaseModel>>.value(
                  <_i15.TVLocalDatabaseModel>[]))
          as _i7.Future<List<_i15.TVLocalDatabaseModel>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i6.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i16.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i16.Database?>.value())
          as _i7.Future<_i16.Database?>);
  @override
  _i7.Future<int> insertWatchlist(_i10.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> insertWatchlistTVSeries(_i15.TVLocalDatabaseModel? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTVSeries, [tv]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlist({int? id, String? table = r'watchlist'}) =>
      (super.noSuchMethod(
          Invocation.method(#removeWatchlist, [], {#id: id, #table: table}),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getDataById(
          {int? id, String? table = r'watchlist'}) =>
      (super.noSuchMethod(
              Invocation.method(#getDataById, [], {#id: id, #table: table}),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlist(
          {String? table = r'watchlist'}) =>
      (super.noSuchMethod(Invocation.method(#getWatchlist, [], {#table: table}),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i18.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i18.Uint8List>.value(_i18.Uint8List(0)))
          as _i7.Future<_i18.Uint8List>);
  @override
  _i7.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4()))
          as _i7.Future<_i5.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
