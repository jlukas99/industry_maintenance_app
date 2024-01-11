import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/features/zone_page/data/datasources/zone_data_source.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/entities/zone.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/repositories/zone_repo.dart';
import 'package:industry_maintenance_app/features/zone_page/zone_failures.dart';

class ZoneRepoImp implements ZoneRepo {
  ZoneRepoImp({required this.zoneDataSource});
  final ZoneDataSource zoneDataSource;

  @override
  Future<Either<Failure, void>> createZone({
    required String zoneName,
    required String zoneID,
    String? zonePicture,
  }) async {
    try {
      final result = await zoneDataSource.createZone(
        zoneName: zoneName,
        zoneID: zoneID,
        zonePicture: zonePicture,
      );
      return Right(result);
    } catch (error) {
      return const Left(
        CreateZoneFailure(failureMessage: 'Unable to create new zone'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteZone({required String zoneID}) async {
    try {
      final result = await zoneDataSource.deleteZone(zoneID: zoneID);
      return Right(result);
    } catch (error) {
      return const Left(
          DeleteZoneFailure(failureMessage: 'Unable to delete failure'),);
    }
  }

  @override
  Future<Either<Failure, bool>> zoneExists({required String zoneName}) async {
    try {
      final result = await zoneDataSource.zoneExists(zoneName: zoneName);
      return Right(result);
    } catch (error) {
      return const Left(
          CheckZoneExistFailure(failureMessage: 'Unable to check zone'),);
    }
  }

  @override
  Future<Either<Failure, Stream<List<FactoryZone>>>> fetchZones() async {
    try {
      final result = zoneDataSource.fetchZones();
      return Right(result);
    } catch (error) {
      return const Left(
          FetchZonesFailure(failureMessage: 'Unable to fetch failure'),);
    }
  }

  @override
  Future<Either<Failure, Stream<List<FactoryZone>>>> findZone({
    required String zoneName,
  }) async {
    try {
      final result = zoneDataSource.findZone(zoneName: zoneName);
      return Right(result);
    } catch (error) {
      return const Left(FindZoneFailure(failureMessage: 'Unable to find zone'));
    }
  }
}
