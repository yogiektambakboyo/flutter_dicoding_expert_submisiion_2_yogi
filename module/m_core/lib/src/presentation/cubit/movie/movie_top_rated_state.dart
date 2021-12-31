part of 'movie_top_rated_cbt.dart';

abstract class MovieTopRatedState extends Equatable {
  const MovieTopRatedState();

  @override
  List<Object> get props => [];
}

class MovieTopRatedInitialState extends MovieTopRatedState {
  const MovieTopRatedInitialState();
}

class MovieTopRatedLoadingState extends MovieTopRatedState {
  const MovieTopRatedLoadingState();
}

class MovieTopRatedErrorState extends MovieTopRatedState {
  const MovieTopRatedErrorState(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];


}

class MovieTopRatedLoadedState extends MovieTopRatedState {
  const MovieTopRatedLoadedState({
    required this.items,
  });

  final List<Movie> items;

  @override
  List<Object> get props => [items];


}
