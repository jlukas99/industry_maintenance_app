import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';

abstract class UserRepo {
  const UserRepo();

  Future<Either<Failure, void>> createUser({
    required String userName,
    required String userSurName,
    required String userPassword,
    required String userLogin,
  });

  Future<Either<Failure, String>> loginUser({
    required String userPassword,
    required String userLogin,
  });

  Future<Either<Failure, MyUser>> getUser({
    required String userID,
  });

  Future<Either<Failure, void>> logOutUser();
}
