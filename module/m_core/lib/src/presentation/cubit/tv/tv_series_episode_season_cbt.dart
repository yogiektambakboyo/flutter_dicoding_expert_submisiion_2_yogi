import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tv/tv_episode.dart';
import '../../../domain/usecases/tv/get_episode_season_tv_series.dart';

part 'tv_series_episode_season_state.dart';

class TVSeriesEpisodeSeasonCbt extends Cubit<TVSeriesEpisodeSeasonState> {
  TVSeriesEpisodeSeasonCbt({
    required this.getEpisodeSeasonTVSeries,
  }) : super(const TVSeriesEpisodeSeasonInitialState());

  final GetEpisodeSeasonTVSeries getEpisodeSeasonTVSeries;
  Future<void> get({
    required int id,
    required int seasonNumber,
  }) async {
    emit(const TVSeriesEpisodeSeasonLoadingState());
    final result = await getEpisodeSeasonTVSeries.execute(
      id: id,
      seasonNumber: seasonNumber,
    );
    result.fold(
      (failure) => emit(TVSeriesEpisodeSeasonErrorState(failure.message)),
      (values) => emit(TVSeriesEpisodeSeasonLoadedState(items: values)),
    );
  }
}
