import 'package:m_core/m_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_watchlist/m_watchlist.dart';

part 'tv_series_watchlist_state.dart';

class TVSeriesWatchlistCbt extends Cubit<TVSeriesWatchlistState> {
  TVSeriesWatchlistCbt({
    required this.getWatchlistTVSeries,
  }) : super(const TVSeriesWatchlistInitialState());

  final GetWatchlistTVSeries getWatchlistTVSeries;

  Future<void> get() async {
    emit(const TVSeriesWatchlistLoadingState());
    final result = await getWatchlistTVSeries.execute();
    result.fold(
      (failure) => emit(TVSeriesWatchlistErrorState(failure.message)),
      (values) => emit(TVSeriesWatchlistLoadedState(items: values)),
    );
  }
}
