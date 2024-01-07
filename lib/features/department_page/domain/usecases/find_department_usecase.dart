import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/department_page/domain/repositories/department_repo.dart';

class FindDepartmentUseCase implements UseCaseWithParams<Stream, FindDepartmentParams>{
  final DepartmentRepo repo;
  const FindDepartmentUseCase({required this.repo});

  @override
  Future<Either<Failure, Stream>> call(FindDepartmentParams params) async{
    return await repo.findDepartment(departmentName: params.departmentName);
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindDepartmentParams extends Equatable{
  final String departmentName;
  const FindDepartmentParams({required this.departmentName});
  const FindDepartmentParams.empty() : this(
    departmentName: '',
  );
  @override
  List<Object> get props => [departmentName];

}