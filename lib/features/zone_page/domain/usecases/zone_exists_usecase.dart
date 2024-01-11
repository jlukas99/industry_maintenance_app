import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/repositories/zone_repo.dart';

class ZoneExistsUseCase implements UseCaseWithParams<void, ZoneExistsParams> {
  const ZoneExistsUseCase({required this.repo});
  final ZoneRepo repo;

  @override
  Future<Either<Failure, bool>> call(ZoneExistsParams params) async {
    return await repo.zoneExists(zoneName: params.zoneName);
  }
}

class ZoneExistsParams extends Equatable {
  const ZoneExistsParams({required this.zoneName});
  const ZoneExistsParams.empty() : this(zoneName: '');

  final String zoneName;

  @override
  List<Object> get props => [zoneName];
}
