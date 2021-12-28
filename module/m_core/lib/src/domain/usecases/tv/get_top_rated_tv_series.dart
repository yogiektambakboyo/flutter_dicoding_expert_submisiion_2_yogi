import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/tv/tv.dart';
import '../../repositories/tv_repository.dart';

class GetTopRatedTVSeries {
  final TVRepository repository;
  GetTopRatedTVSeries({
    required this.repository,
  });
  Future<Either<Failure, List<TV>>> execute() {
    return repository.getTopRatedTVSeries();
  }
}
