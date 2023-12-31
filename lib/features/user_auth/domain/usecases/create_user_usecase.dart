import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/repositories/user_repo.dart';

class CreateUserUseCase implements UseCaseWithParams<void, UserParams>{
  final UserRepo repo;
  const CreateUserUseCase({required this.repo});

  @override
  Future<Either<Failure, void>> call(UserParams params) async{
    return await repo.createUser(
        userName: params.userName,
        userSurName: params.userSurName,
        userPassword: params.userPassword,
        userLogin: params.userLogin);
    // TODO: implement call
    throw UnimplementedError();
  }
}

class UserParams extends Equatable{
  final String userName;
  final String userPassword;
  final String userLogin;
  final String userSurName;
  const UserParams({
    required this.userPassword,
    required this.userLogin,
    required this.userSurName,
    required this.userName,
});

  @override
  List<Object> get props => [userSurName, userName, userLogin, userPassword];

}