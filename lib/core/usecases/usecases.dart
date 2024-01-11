import 'package:dartz/dartz.dart';

import 'package:industry_maintenance_app/core/failure/failure.dart';

abstract class UseCaseWithParams<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  Future<Either<Failure, Type>> call();
}
