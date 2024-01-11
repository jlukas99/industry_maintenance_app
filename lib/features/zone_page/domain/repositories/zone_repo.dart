import 'package:dartz/dartz.dart';

import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/entities/zone.dart';

abstract class ZoneRepo {
  const ZoneRepo();

  Future<Either<Failure, void>> createZone({
    required String zoneName,
    required String zoneID,
    String? zonePicture,
  });

  Future<Either<Failure, void>> deleteZone({
    required String zoneID,
  });

  Future<Either<Failure, bool>> zoneExists({
    required String zoneName,
  });

  Future<Either<Failure, Stream<List<FactoryZone>>>> fetchZones();

  Future<Either<Failure, Stream<List<FactoryZone>>>> findZone({
    required String zoneName,
  });
}
