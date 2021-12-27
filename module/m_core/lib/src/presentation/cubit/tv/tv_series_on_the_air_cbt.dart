import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_core/src/domain/usecases/tv/get_on_the_air_tv_series.dart';

import '../../../domain/entities/tv/tv.dart';
part 'tv_series_on_the_air_state.dart';

class TVSeriesOnTheAirCbt extends Cubit<TVSeriesOnTheAirState> {
  TVSeriesOnTheAirCbt({
    required this.getOnTheAirTVSeries,
  }) : super(const TVSeriesOnTheAirInitial());

  final GetOnTheAirTVSeries getOnTheAirTVSeries;
  Future<void> get() async {
    emit(const TVSeriesOnTheAirLoading());
    final result = await getOnTheAirTVSeries.execute();
    result.fold(
      (failure) => emit(TVSeriesOnTheAirError(failure.message)),
      (value) => emit(TVSeriesOnTheAirLoaded(items: value)),
    );
  }
}
