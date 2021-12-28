import 'package:m_core/m_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_watchlist/m_watchlist.dart';

part 'movie_watchlist_state.dart';

class MovieWatchlistCbt extends Cubit<MovieWatchlistState> {
  MovieWatchlistCbt({
    required this.getWatchlistMovies,
  }) : super(const MovieWatchlistInitialState());

  final GetWatchlistMovies getWatchlistMovies;

  Future<void> get() async {
    emit(const MovieWatchlistLoadingState());
    final result = await getWatchlistMovies.execute();
    result.fold(
      (failure) => emit(MovieWatchlistErrorState(failure.message)),
      (values) => emit(MovieWatchlistLoadedState(items: values)),
    );
  }
}
