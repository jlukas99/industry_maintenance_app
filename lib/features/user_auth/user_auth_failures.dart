import 'package:industry_maintenance_app/core/failure/failure.dart';

class CreateUserFailure extends Failure{
  const CreateUserFailure({required super.failureMessage});
}

class LoginUserFailure extends Failure{
  const LoginUserFailure({required super.failureMessage});
}

class GettingUserFailure extends Failure{
  const GettingUserFailure({required super.failureMessage});
}