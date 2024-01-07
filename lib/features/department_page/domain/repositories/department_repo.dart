import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/features/department_page/domain/entities/department.dart';

import '../../../../core/failure/failure.dart';

abstract class DepartmentRepo{
  const DepartmentRepo();

  Future<Either<Failure, void>> addDepartment({
    required String departmentName,
    required String zoneName,
    required String departmentPhoto,
    required String departmentID,
});

  Future<Either<Failure, void>> deleteDepartment({
    required String departmentID,
});

  Future<Either<Failure, Stream<List<Department>>>> fetchDepartments();

  Future<Either<Failure, Stream<List<Department>>>> findDepartment({
    required String departmentName,
});

}