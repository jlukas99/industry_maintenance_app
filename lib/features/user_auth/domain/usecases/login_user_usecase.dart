import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/repositories/user_repo.dart';

class LoginUserUseCase implements UseCaseWithParams<void, LoginParams> {
  const LoginUserUseCase({required this.repo});
  final UserRepo repo;

  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
    return await repo.loginUser(
      userPassword: params.userPassword,
      userLogin: params.userLogin,
    );
  }
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.userPassword,
    required this.userLogin,
  });

  final String userLogin;
  final String userPassword;

  @override
  List<Object> get props => [userLogin, userPassword];
}
