import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/repositories/zone_repo.dart';

class DeleteZoneUseCase implements UseCaseWithParams<void, DeleteZoneParams> {
  const DeleteZoneUseCase({required this.repo});
  final ZoneRepo repo;

  @override
  Future<Either<Failure, void>> call(DeleteZoneParams params) async {
    return await repo.deleteZone(zoneID: params.zoneID);
  }
}

class DeleteZoneParams extends Equatable {
  const DeleteZoneParams({required this.zoneID});

  const DeleteZoneParams.empty() : this(zoneID: '');

  final String zoneID;

  @override
  List<Object> get props => [zoneID];
}
