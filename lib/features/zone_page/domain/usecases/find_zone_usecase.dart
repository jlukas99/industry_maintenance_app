import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/entities/zone.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/repositories/zone_repo.dart';

class FindZoneUseCase implements UseCaseWithParams<Stream, FindZoneParams>{
  final ZoneRepo repo;
  const FindZoneUseCase({required this.repo});

  @override
  Future<Either<Failure, Stream<List<FactoryZone>>>> call(FindZoneParams params) async{
    return await repo.findZone(zoneName: params.zoneName);
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindZoneParams extends Equatable{
  final String zoneName;
  const FindZoneParams({required this.zoneName});
  const FindZoneParams.empty() : this(
    zoneName: '',
  );

  @override
  List<Object> get props => [zoneName];
}