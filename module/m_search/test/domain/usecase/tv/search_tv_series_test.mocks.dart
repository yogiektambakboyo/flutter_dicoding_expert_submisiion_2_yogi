import 'dart:async' as _i4;

import 'package:m_core/m_core.dart' as _i3;
import 'package:m_core/src/domain/entities/tv/tv_detail.dart' as _i5;
import 'package:m_core/src/domain/entities/tv/tv_episode.dart' as _i6;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [TVRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVRepository extends _i1.Mock implements _i3.TVRepository {
  MockTVRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> getOnTheAirTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getOnTheAirTVSeries, []),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> getPopularTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularTVSeries, []),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> getTopRatedTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTVSeries, []),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> getRecommendationTVSeries(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getRecommendationTVSeries, [id]),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, _i5.TVDetail>> getDetailTVSeries(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTVSeries, [id]),
              returnValue: Future<_i2.Either<_i3.Failure, _i5.TVDetail>>.value(
                  _FakeEither_0<_i3.Failure, _i5.TVDetail>()))
          as _i4.Future<_i2.Either<_i3.Failure, _i5.TVDetail>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> searchTVSeries(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVSeries, [query]),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i6.Episode>>>
      getEpisodeSeasonTVSeries({int? id, int? seasonNumber}) => (super
              .noSuchMethod(
                  Invocation.method(
                      #getEpisodeSeasonTVSeries, [], {
                    #id: id,
                    #seasonNumber: seasonNumber
                  }),
                  returnValue:
                      Future<_i2.Either<_i3.Failure, List<_i6.Episode>>>.value(
                          _FakeEither_0<_i3.Failure, List<_i6.Episode>>()))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i6.Episode>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, String>> insertWatchlistTVSeries(
          _i5.TVDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTVSeries, [tv]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i4.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, String>> removeWatchlistTVSeries(
          _i5.TVDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTVSeries, [tv]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i4.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i4.Future<bool> isAddedToWatchlistTVSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTVSeries, [id]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>> getWatchlistTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTVSeries, []),
              returnValue: Future<_i2.Either<_i3.Failure, List<_i3.TV>>>.value(
                  _FakeEither_0<_i3.Failure, List<_i3.TV>>()))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i3.TV>>>);
  @override
  String toString() => super.toString();
}
