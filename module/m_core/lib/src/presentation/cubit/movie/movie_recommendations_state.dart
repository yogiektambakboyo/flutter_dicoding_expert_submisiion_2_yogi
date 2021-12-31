part of 'movie_recommendations_cbt.dart';

abstract class MovieRecommendationsState extends Equatable {
  const MovieRecommendationsState();

  @override
  List<Object> get props => [];
}

class MovieRecommendationsInitialState extends MovieRecommendationsState {
  const MovieRecommendationsInitialState();
}

class MovieRecommendationsLoadingState extends MovieRecommendationsState {
  const MovieRecommendationsLoadingState();
}

class MovieRecommendationsErrorState extends MovieRecommendationsState {
  const MovieRecommendationsErrorState(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];


}

class MovieRecommendationsLoadedState extends MovieRecommendationsState {
  const MovieRecommendationsLoadedState({
    required this.items,
  });

  final List<Movie> items;

  @override
  List<Object> get props => [items];


}
