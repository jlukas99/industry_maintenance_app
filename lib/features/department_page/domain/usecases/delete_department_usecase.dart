import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/department_page/domain/repositories/department_repo.dart';

class DeleteDepartmentUseCase implements UseCaseWithParams<void, DeleteDepartmentParams>{
  final DepartmentRepo repo;
  const DeleteDepartmentUseCase({required this.repo});
  @override
  Future<Either<Failure, void>> call(params) async{
    return await repo.deleteDepartment(departmentID: params.departmentID);
    // TODO: implement call
    throw UnimplementedError();
  }
}

class DeleteDepartmentParams extends Equatable{
  final String departmentID;
  const DeleteDepartmentParams({required this.departmentID});
  const DeleteDepartmentParams.empty() : this(
    departmentID: '',
  );

  @override
  List<Object> get props => [departmentID];

}