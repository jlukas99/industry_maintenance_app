import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';

import '../repositories/user_repo.dart';

class LogOutUserUseCase implements UseCaseWithoutParams{
  final UserRepo repo;
  const LogOutUserUseCase({required this.repo});

  @override
  Future<Either<Failure, void>> call() async{
    return await repo.logOutUser();
    // TODO: implement call
    // throw UnimplementedError();
  }
}