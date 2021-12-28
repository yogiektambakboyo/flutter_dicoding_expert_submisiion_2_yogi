import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entities/tv/tv_detail.dart';
import '../../repositories/tv_repository.dart';

class SaveWatchlistTVSeries {
  final TVRepository repository;
  SaveWatchlistTVSeries({
    required this.repository,
  });

  Future<Either<Failure, String>> execute(TVDetail tv) {
    return repository.insertWatchlistTVSeries(tv);
  }
}
