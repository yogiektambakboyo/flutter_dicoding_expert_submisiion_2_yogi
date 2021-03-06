part of 'tv_series_on_the_air_cbt.dart';

abstract class TVSeriesOnTheAirState extends Equatable {
  const TVSeriesOnTheAirState();
  @override
  List<Object> get props => [];
}

class TVSeriesOnTheAirInitial extends TVSeriesOnTheAirState {
  const TVSeriesOnTheAirInitial();
}

class TVSeriesOnTheAirLoading extends TVSeriesOnTheAirState {
  const TVSeriesOnTheAirLoading();
}

class TVSeriesOnTheAirLoaded extends TVSeriesOnTheAirState {
  const TVSeriesOnTheAirLoaded({
    required this.items,
  });

  final List<TV> items;

  @override
  List<Object> get props => [items];


}

class TVSeriesOnTheAirError extends TVSeriesOnTheAirState {
  const TVSeriesOnTheAirError(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];


}
