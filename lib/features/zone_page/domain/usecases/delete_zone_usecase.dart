import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/repositories/zone_repo.dart';

class DeleteZoneUseCase implements UseCaseWithParams<void, DeleteZoneParams>{
  final ZoneRepo repo;
  const DeleteZoneUseCase({required this.repo});

  @override
  Future<Either<Failure, void>> call(params) async{
    return await repo.deleteZone(zoneID: params.zoneID);
    // TODO: implement call
    throw UnimplementedError();
  }
}

class DeleteZoneParams extends Equatable{
  final String zoneID;
  const DeleteZoneParams({required this.zoneID});
  const DeleteZoneParams.empty() : this(
    zoneID: '',
  );
  @override
  List<Object> get props => [zoneID];
}