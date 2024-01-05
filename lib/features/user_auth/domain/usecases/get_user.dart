import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:industry_maintenance_app/core/failure/failure.dart';
import 'package:industry_maintenance_app/core/usecases/usecases.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';

import '../repositories/user_repo.dart';

class GetUserUseCase implements UseCaseWithParams<void, GetUserParams>{
  final UserRepo repo;
  const GetUserUseCase({required this.repo});

  @override
  Future<Either<Failure, MyUser>> call(params) async{
    return await repo.getUser(userID: params.userID);
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GetUserParams extends Equatable{
  final String userID;
  const GetUserParams({required this.userID});
  const GetUserParams.empty() : this(
    userID: '',
  );

  @override
  List<Object> get props => [userID];
}