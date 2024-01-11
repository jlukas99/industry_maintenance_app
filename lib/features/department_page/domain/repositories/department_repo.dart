import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/features/department_page/domain/entities/department.dart';

abstract class DepartmentRepo {
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

  Future<Either<Failure, Stream<List<Department>>>> fetchDepartments({
    required String zoneName,
  });

  Future<Either<Failure, Stream<List<Department>>>> findDepartment({
    required String departmentName,
  });
}
