import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';

import 'package:industry_maintenance_app/features/user_auth/domain/repositories/user_repo.dart';

class GetUserUseCase implements UseCaseWithParams<void, GetUserParams> {
  const GetUserUseCase({required this.repo});
  final UserRepo repo;

  @override
  Future<Either<Failure, MyUser>> call(GetUserParams params) async {
    return await repo.getUser(userID: params.userID);
  }
}

class GetUserParams extends Equatable {
  const GetUserParams({required this.userID});
  const GetUserParams.empty()
      : this(
          userID: '',
        );
  final String userID;

  @override
  List<Object> get props => [userID];
}
