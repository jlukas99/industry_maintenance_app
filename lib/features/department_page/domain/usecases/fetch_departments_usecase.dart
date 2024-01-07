import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/department_page/domain/repositories/department_repo.dart';

class FetchDepartmentsUseCase implements UseCaseWithoutParams{
  final DepartmentRepo repo;
  const FetchDepartmentsUseCase({required this.repo});

  @override
  Future<Either<Failure, dynamic>> call() async{
    return await repo.fetchDepartments();
    // TODO: implement call
    throw UnimplementedError();
  }
}