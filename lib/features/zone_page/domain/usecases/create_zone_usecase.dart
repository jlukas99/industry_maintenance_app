import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/repositories/zone_repo.dart';

class CreateZoneUseCase implements UseCaseWithParams<void, ZoneParams> {
  const CreateZoneUseCase({required this.repo});
  final ZoneRepo repo;

  @override
  Future<Either<Failure, void>> call(ZoneParams params) async {
    return await repo.createZone(
      zoneName: params.zoneName,
      zoneID: params.zoneID,
      zonePicture: params.zonePicture,
    );
  }
}

class ZoneParams extends Equatable {
  const ZoneParams({
    required this.zoneName,
    required this.zoneID,
    this.zonePicture,
  });
  const ZoneParams.empty()
      : this(
          zoneID: '',
          zoneName: '',
          zonePicture: '',
        );
  final String zoneName;
  final String zoneID;
  final String? zonePicture;

  @override
  List<Object> get props => [zoneID, zoneName];
}
