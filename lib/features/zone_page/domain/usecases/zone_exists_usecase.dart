import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/repositories/zone_repo.dart';

class ZoneExistsUseCase implements UseCaseWithParams<void, ZoneExistsParams>{
  final ZoneRepo repo;
  const ZoneExistsUseCase({required this.repo});

  @override
  Future<Either<Failure, bool>> call(params) async{
    return await repo.zoneExists(zoneName: params.zoneName);
    // TODO: implement call
    throw UnimplementedError();
  }
}

class ZoneExistsParams extends Equatable{
  final String zoneName;
  const ZoneExistsParams({required this.zoneName});
  const ZoneExistsParams.empty() : this(
    zoneName: '',
  );
  @override
  List<Object> get props => [zoneName];

}