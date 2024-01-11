import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/department_page/domain/repositories/department_repo.dart';

class DeleteDepartmentUseCase
    implements UseCaseWithParams<void, DeleteDepartmentParams> {
  const DeleteDepartmentUseCase({required this.repo});
  final DepartmentRepo repo;
  @override
  Future<Either<Failure, void>> call(DeleteDepartmentParams params) async {
    return await repo.deleteDepartment(departmentID: params.departmentID);
  }
}

class DeleteDepartmentParams extends Equatable {
  const DeleteDepartmentParams({required this.departmentID});
  const DeleteDepartmentParams.empty()
      : this(
          departmentID: '',
        );
  final String departmentID;

  @override
  List<Object> get props => [departmentID];
}
