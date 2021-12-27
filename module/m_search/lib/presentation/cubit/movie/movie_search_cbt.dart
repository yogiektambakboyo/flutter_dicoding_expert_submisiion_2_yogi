import 'package:m_core/m_core.dart';
import '../../../m_search.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_search_state.dart';

class MovieSearchCbt extends Cubit<MovieSearchState> {
  MovieSearchCbt({
    required this.searchMovies,
  }) : super(const MovieSearchInitialState());
  final SearchMovies searchMovies;
  Future<void> get(String query) async {
    emit(const MovieSearchLoadingState());
    final result = await searchMovies.execute(query);
    result.fold(
      (failure) => emit(
        MovieSearchErrorState(failure.message),
      ),
      (values) => emit(
        MovieSearchLoadedState(items: values),
      ),
    );
  }
}
