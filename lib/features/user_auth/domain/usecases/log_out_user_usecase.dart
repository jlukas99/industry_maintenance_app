import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';

import 'package:industry_maintenance_app/features/user_auth/domain/repositories/user_repo.dart';

class LogOutUserUseCase implements UseCaseWithoutParams<void> {
  const LogOutUserUseCase({required this.repo});
  final UserRepo repo;

  @override
  Future<Either<Failure, void>> call() async {
    return await repo.logOutUser();
  }
}
