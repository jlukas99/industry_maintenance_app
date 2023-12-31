
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/zone.dart';

abstract class ZoneRepo{
  const ZoneRepo();

  Future<Either<Failure, void>> createZone({
    required String zoneName,
    required zoneID,
    String? zonePicture,
});

  Future<Either<Failure, void>> deleteZone({
    required String zoneID,
});

  Future<Either<Failure, bool>> zoneExists({
    required String zoneName,
});

  Future<Either<Failure, Stream<List<FactoryZone>>>> fetchZones();

}