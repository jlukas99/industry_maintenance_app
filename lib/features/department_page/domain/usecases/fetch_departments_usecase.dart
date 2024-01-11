import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/department_page/domain/entities/department.dart';
import 'package:industry_maintenance_app/features/department_page/domain/repositories/department_repo.dart';

class FetchDepartmentsUseCase
    implements
        UseCaseWithParams<Stream<List<Department>>, FetchDepartmentParams> {
  const FetchDepartmentsUseCase({required this.repo});
  final DepartmentRepo repo;

  @override
  Future<Either<Failure, Stream<List<Department>>>> call(
    FetchDepartmentParams params,
  ) async {
    return await repo.fetchDepartments(zoneName: params.zoneName);
  }
}

class FetchDepartmentParams extends Equatable {
  const FetchDepartmentParams({required this.zoneName});
  const FetchDepartmentParams.empty()
      : this(
          zoneName: '',
        );
  final String zoneName;

  @override
  List<Object> get props => [zoneName];
}
