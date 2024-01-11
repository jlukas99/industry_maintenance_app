import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/entities/zone.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/repositories/zone_repo.dart';

class FetchZoneUseCase
    implements UseCaseWithoutParams<Stream<List<FactoryZone>>> {
  FetchZoneUseCase({required this.repo});
  final ZoneRepo repo;

  @override
  Future<Either<Failure, Stream<List<FactoryZone>>>> call() {
    return repo.fetchZones();
  }
}
