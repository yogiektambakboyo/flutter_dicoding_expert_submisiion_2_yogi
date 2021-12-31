part of 'movie_popular_cbt.dart';

abstract class MoviePopularState extends Equatable {
  const MoviePopularState();

  @override
  List<Object> get props => [];
}

class MoviePopularInitialState extends MoviePopularState {
  const MoviePopularInitialState();
}

class MoviePopularLoadingState extends MoviePopularState {
  const MoviePopularLoadingState();
}

class MoviePopularErrorState extends MoviePopularState {
  const MoviePopularErrorState(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];


}

class MoviePopularLoadedState extends MoviePopularState {
  const MoviePopularLoadedState({
    required this.items,
  });

  final List<Movie> items;

  @override
  List<Object> get props => [items];


}
