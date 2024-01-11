import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/department_page/domain/entities/department.dart';
import 'package:industry_maintenance_app/features/department_page/domain/repositories/department_repo.dart';

class FindDepartmentUseCase
    implements
        UseCaseWithParams<Stream<List<Department>>, FindDepartmentParams> {
  const FindDepartmentUseCase({required this.repo});
  final DepartmentRepo repo;

  @override
  Future<Either<Failure, Stream<List<Department>>>> call(
    FindDepartmentParams params,
  ) async {
    return await repo.findDepartment(departmentName: params.departmentName);
  }
}

class FindDepartmentParams extends Equatable {
  const FindDepartmentParams({required this.departmentName});
  const FindDepartmentParams.empty() : this(departmentName: '');

  final String departmentName;

  @override
  List<Object> get props => [departmentName];
}
