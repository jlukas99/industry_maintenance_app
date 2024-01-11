import 'package:industry_maintenance_app/core/failure/failure.dart';

class CreateZoneFailure extends Failure {
  const CreateZoneFailure({required super.failureMessage});
}

class DeleteZoneFailure extends Failure {
  const DeleteZoneFailure({required super.failureMessage});
}

class CheckZoneExistFailure extends Failure {
  const CheckZoneExistFailure({required super.failureMessage});
}

class FetchZonesFailure extends Failure {
  const FetchZonesFailure({required super.failureMessage});
}

class FindZoneFailure extends Failure {
  const FindZoneFailure({required super.failureMessage});
}
