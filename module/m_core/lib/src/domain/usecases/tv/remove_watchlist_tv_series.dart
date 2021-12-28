import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entities/tv/tv_detail.dart';
import '../../repositories/tv_repository.dart';

class RemoveWatchlistTVSeries {
  final TVRepository repository;
  RemoveWatchlistTVSeries({
    required this.repository,
  });

  Future<Either<Failure, String>> execute(TVDetail tv) {
    return repository.removeWatchlistTVSeries(tv);
  }
}
