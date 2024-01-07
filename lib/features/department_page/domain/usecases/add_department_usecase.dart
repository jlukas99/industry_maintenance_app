import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/department_page/domain/repositories/department_repo.dart';

class AddDepartmentUseCase implements UseCaseWithParams<void, AddDepartmentParams>{
  final DepartmentRepo repo;
  const AddDepartmentUseCase({required this.repo});

  @override
  Future<Either<Failure, void>> call(params) async{
    return await repo.addDepartment(
        departmentName: params.departmentName,
        zoneName: params.zoneName,
        departmentPhoto: params.departmentPhoto,
        departmentID: params.departmentID);
    // TODO: implement call
    throw UnimplementedError();
  }
}

class AddDepartmentParams extends Equatable{
  final String departmentName;
  final String zoneName;
  final String departmentPhoto;
  final String departmentID;
  const AddDepartmentParams({
    required this.departmentName,
    required this.departmentID,
    required this.zoneName,
    required this.departmentPhoto,
  });
  const AddDepartmentParams.empty() : this(
    departmentID: '',
    departmentName: '',
    departmentPhoto: '',
    zoneName: ''
  );

  @override
  List<Object> get props => [departmentID, departmentPhoto, departmentName, zoneName];

}