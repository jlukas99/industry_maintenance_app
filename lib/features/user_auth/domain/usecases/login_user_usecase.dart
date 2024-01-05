import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/repositories/user_repo.dart';

import '../entities/user.dart';

class LoginUserUseCase implements UseCaseWithParams<void, LoginParams>{
  final UserRepo repo;
  const LoginUserUseCase({required this.repo});

  @override
  Future<Either<Failure, String>> call(params) async{
    return await repo.loginUser(userPassword: params.userPassword, userLogin: params.userLogin);
    // TODO: implement call
    throw UnimplementedError();
  }
}

class LoginParams extends Equatable{
  final String userLogin;
  final String userPassword;
  const LoginParams({
    required this.userPassword,
    required this.userLogin,
});
  @override
  List<Object> get props => [userLogin, userPassword];
}