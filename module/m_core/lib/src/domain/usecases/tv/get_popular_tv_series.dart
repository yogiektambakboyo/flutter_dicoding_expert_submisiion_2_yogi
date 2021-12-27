import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/tv/tv.dart';
import '../../repositories/tv_repository.dart';

class GetPopularTVSeries {
  final TVRepository repository;

  GetPopularTVSeries({
    required this.repository,
  });
  Future<Either<Failure, List<TV>>> execute() {
    return repository.getPopularTVSeries();
  }
}
