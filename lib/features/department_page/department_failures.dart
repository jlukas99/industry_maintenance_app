import 'package:industry_maintenance_app/core/failure/failure.dart';

class AddDepartmentFailure extends Failure {
  const AddDepartmentFailure({required super.failureMessage});
}

class DeleteDepartmentFailure extends Failure {
  const DeleteDepartmentFailure({required super.failureMessage});
}

class FetchDepartmentFailure extends Failure {
  const FetchDepartmentFailure({required super.failureMessage});
}

class FindDepartmentFailure extends Failure {
  const FindDepartmentFailure({
    required super.failureMessage,
  });
}
