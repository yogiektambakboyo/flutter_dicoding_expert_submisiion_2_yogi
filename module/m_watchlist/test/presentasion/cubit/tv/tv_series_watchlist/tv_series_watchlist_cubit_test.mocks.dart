import 'dart:async' as _i5;

import 'package:m_core/m_core.dart' as _i2;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:m_watchlist/domain/usecase/tv/get_watchlist_tv_series.dart'
    as _i4;

class _FakeTVRepository_0 extends _i1.Fake implements _i2.TVRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetWatchlistTVSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTVSeries extends _i1.Mock
    implements _i4.GetWatchlistTVSeries {
  MockGetWatchlistTVSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_0()) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i2.Failure, List<_i2.TV>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
              returnValue: Future<_i3.Either<_i2.Failure, List<_i2.TV>>>.value(
                  _FakeEither_1<_i2.Failure, List<_i2.TV>>()))
          as _i5.Future<_i3.Either<_i2.Failure, List<_i2.TV>>>);
  @override
  String toString() => super.toString();
}
