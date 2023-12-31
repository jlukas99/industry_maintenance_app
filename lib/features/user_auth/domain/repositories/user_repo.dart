import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';
import '../../../../core/failure/failure.dart';

abstract class UserRepo {
  const UserRepo();

  Future<Either<Failure, void>> createUser({
    required String userName,
    required String userSurName,
    required String userPassword,
    required String userLogin,

});

  Future<Either<Failure, User>> loginUser({
    required String userPassword,
    required String userLogin,
});


}