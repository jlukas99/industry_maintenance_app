import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/repositories/zone_repo.dart';

class CreateZoneUseCase implements UseCaseWithParams<void, ZoneParams>{
  final ZoneRepo repo;
  const CreateZoneUseCase({required this.repo});

  @override
  Future<Either<Failure, void>> call(params) async{
    return await repo.createZone(
        zoneName: params.zoneName,
        zoneID: params.zoneID,
        zonePicture: params.zonePicture);
    // TODO: implement call
    throw UnimplementedError();
  }
}

class ZoneParams extends Equatable{
  final String zoneName;
  final String zoneID;
  final String? zonePicture;
  const ZoneParams({
    this.zonePicture,
    required this.zoneName,
    required this.zoneID,
});
  const ZoneParams.empty() : this(
    zoneID: '',
    zoneName: '',
    zonePicture: '',
  );

  @override
  List<Object> get props => [zoneID, zoneName];

}