import 'package:dartz/dartz.dart';
import 'package:m_core/m_core.dart';

class SearchTVSeries {
  final TVRepository repository;
  SearchTVSeries({
    required this.repository,
  });

  Future<Either<Failure, List<TV>>> execute(String query) {
    return repository.searchTVSeries(query);
  }
}
