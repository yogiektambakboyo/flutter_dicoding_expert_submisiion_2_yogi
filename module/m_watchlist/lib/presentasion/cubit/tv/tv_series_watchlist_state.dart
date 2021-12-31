part of 'tv_series_watchlist_cbt.dart';

abstract class TVSeriesWatchlistState extends Equatable {
  const TVSeriesWatchlistState();

  @override
  List<Object> get props => [];
}

class TVSeriesWatchlistInitialState extends TVSeriesWatchlistState {
  const TVSeriesWatchlistInitialState();
}

class TVSeriesWatchlistLoadingState extends TVSeriesWatchlistState {
  const TVSeriesWatchlistLoadingState();
}

class TVSeriesWatchlistErrorState extends TVSeriesWatchlistState {
  const TVSeriesWatchlistErrorState(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}

class TVSeriesWatchlistLoadedState extends TVSeriesWatchlistState {
  const TVSeriesWatchlistLoadedState({
    required this.items,
  });

  final List<TV> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;
}
