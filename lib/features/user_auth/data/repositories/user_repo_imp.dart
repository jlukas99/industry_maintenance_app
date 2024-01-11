import 'package:dartz/dartz.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/features/user_auth/data/datasources/user_data_source.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/repositories/user_repo.dart';
import 'package:industry_maintenance_app/features/user_auth/user_auth_failures.dart';

class UserRepoImp implements UserRepo {
  const UserRepoImp({required this.dataSource});
  final UserDataSource dataSource;

  @override
  Future<Either<Failure, void>> createUser({
    required String userName,
    required String userSurName,
    required String userPassword,
    required String userLogin,
  }) async {
    try {
      final result = dataSource.createUser(
        userName: userName,
        userSurName: userSurName,
        userPassword: userPassword,
        userLogin: userLogin,
      );
      return Right(result);
    } catch (error) {
      return const Left(
        CreateUserFailure(
          failureMessage: 'Unable to create new user',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> loginUser({
    required String userPassword,
    required String userLogin,
  }) async {
    try {
      final result = await dataSource.loginUser(
        userLogin: userLogin,
        userPassword: userPassword,
      );
      return Right(result);
    } catch (error) {
      return const Left(
        LoginUserFailure(
          failureMessage: 'Unable to login user',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MyUser>> getUser({required String userID}) async {
    try {
      final result = await dataSource.getUser(userID: userID);
      return Right(result);
    } catch (error) {
      return const Left(
        GettingUserFailure(
          failureMessage: 'Unable to get user',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logOutUser() async {
    try {
      final result = await dataSource.logOutUser();
      return Right(result);
    } catch (error) {
      return const Left(
        LogOutUserFailure(
          failureMessage: 'Unable to logout user',
        ),
      );
    }
  }
}
