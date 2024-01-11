import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';
part 'failure.g.dart';

@freezed
class EquipmentFailure with _$EquipmentFailure {
  const factory EquipmentFailure({
    required String equipmentID,
    required String failurePriority,
    required String failureCreatedBy,
    required DateTime failureCreatedTime,
    required String failureRepairStartedBy,
    required String failureRepairFinishedBy,
    required DateTime repairStatTime,
    required DateTime repairFinishTime,
    required String failureRemarks,
    required String totalFailurePeriodTime,
    required String
        failureStatus, //i.e. not started, started, finished, during repair, canceled
  }) = _EquipmentFailure;

  factory EquipmentFailure.fromJson(Map<String, dynamic>? json) =>
      _$EquipmentFailureFromJson(json!);
}
