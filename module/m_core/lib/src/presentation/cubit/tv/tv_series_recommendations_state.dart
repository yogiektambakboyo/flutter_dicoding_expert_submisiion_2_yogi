part of 'tv_series_recommendations_cbt.dart';

abstract class TVSeriesRecommendationsState extends Equatable {
  const TVSeriesRecommendationsState();
  @override
  List<Object> get props => [];
}

class TVSeriesRecommendationsInitialState extends TVSeriesRecommendationsState {
  const TVSeriesRecommendationsInitialState();
}

class TVSeriesRecommendationsLoadingState extends TVSeriesRecommendationsState {
  const TVSeriesRecommendationsLoadingState();
}

class TVSeriesRecommendationsErrorState extends TVSeriesRecommendationsState {
  const TVSeriesRecommendationsErrorState(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];


}

class TVSeriesRecommendationsLoadedState extends TVSeriesRecommendationsState {
  const TVSeriesRecommendationsLoadedState({
    required this.items,
  });

  final List<TV> items;

  @override
  List<Object> get props => [items];


}
