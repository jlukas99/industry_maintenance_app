import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/features/department_page/data/datasources/department_data_source.dart';
import 'package:industry_maintenance_app/features/department_page/department_failures.dart';
import 'package:industry_maintenance_app/features/department_page/domain/entities/department.dart';
import 'package:industry_maintenance_app/features/department_page/domain/repositories/department_repo.dart';

class DepartmentRepoImp implements DepartmentRepo{
  final DepartmentDataSource dataSource;
  const DepartmentRepoImp({required this.dataSource});

  @override
  Future<Either<Failure, void>> addDepartment({
    required String departmentName, 
    required String zoneName, 
    required String departmentPhoto, 
    required String departmentID}) async{
    try{
      final result = await dataSource.addDepartment(
          departmentName: departmentName,
          zoneName: zoneName,
          departmentPhoto: departmentPhoto,
          departmentID: departmentID);
      return Right(result);
    }catch(error){
      return const Left(AddDepartmentFailure(failureMessage: 'Unable to add department'));
    }
    // TODO: implement addDepartment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteDepartment({required String departmentID}) async{
    try{
      final result = await dataSource.deleteDepartment(departmentID: departmentID);
      return Right(result);
    }catch(error){
      return const Left(DeleteDepartmentFailure(failureMessage: 'Unable to delete department'));
    }
    // TODO: implement deleteDepartment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Stream<List<Department>>>> fetchDepartments() async{
    try{
      final result = dataSource.fetchDepartments();
      return Right(result);
    }catch(error){
      return const Left(FetchDepartmentFailure(failureMessage: 'Unable to fetch departments'));
    }
    // TODO: implement fetchDepartments
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Stream<List<Department>>>> findDepartment({required String departmentName}) async{
    try{
      final result = dataSource.findDepartment(departmentName: departmentName);
      return Right(result);
    }catch(error){
      return const Left(FindDepartmentFailure(failureMessage: 'Unable to find department'));
    }
    // TODO: implement findDepartment
    throw UnimplementedError();
  }
}