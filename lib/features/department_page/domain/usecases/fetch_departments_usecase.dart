import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/department_page/domain/repositories/department_repo.dart';

import '../entities/department.dart';

class FetchDepartmentsUseCase implements UseCaseWithParams<Stream, FetchDepartmentParams>{
  final DepartmentRepo repo;
  const FetchDepartmentsUseCase({required this.repo});

  @override
  Future<Either<Failure, Stream<List<Department>>>> call(params) async{
    return await repo.fetchDepartments(zoneName: params.zoneName);
    // TODO: implement call
    throw UnimplementedError();
  }


}
class FetchDepartmentParams extends Equatable{
  final String zoneName;
  const FetchDepartmentParams({required this.zoneName});
  const FetchDepartmentParams.empty() : this(
    zoneName: '',
  );

  @override
  List<Object> get props => [zoneName];

}