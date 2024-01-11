import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/repositories/user_repo.dart';

class CreateUserUseCase implements UseCaseWithParams<void, UserParams> {
  const CreateUserUseCase({required this.repo});
  final UserRepo repo;

  @override
  Future<Either<Failure, void>> call(UserParams params) async {
    return await repo.createUser(
      userName: params.userName,
      userSurName: params.userSurName,
      userPassword: params.userPassword,
      userLogin: params.userLogin,
    );
  }
}

class UserParams extends Equatable {
  const UserParams({
    required this.userPassword,
    required this.userLogin,
    required this.userSurName,
    required this.userName,
  });

  final String userName;
  final String userPassword;
  final String userLogin;
  final String userSurName;

  @override
  List<Object> get props => [userSurName, userName, userLogin, userPassword];
}
