part of 'movie_watchlist_cbt.dart';

abstract class MovieWatchlistState extends Equatable {
  const MovieWatchlistState();

  @override
  List<Object> get props => [];
}

class MovieWatchlistInitialState extends MovieWatchlistState {
  const MovieWatchlistInitialState();
}

class MovieWatchlistLoadingState extends MovieWatchlistState {
  const MovieWatchlistLoadingState();
}

class MovieWatchlistErrorState extends MovieWatchlistState {
  const MovieWatchlistErrorState(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}

class MovieWatchlistLoadedState extends MovieWatchlistState {
  const MovieWatchlistLoadedState({
    required this.items,
  });

  final List<Movie> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;
}
