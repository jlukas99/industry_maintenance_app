import 'package:freezed_annotation/freezed_annotation.dart';
part 'equipment.freezed.dart';
part 'equipment.g.dart';

@freezed
class Equipment with _$Equipment {
  const factory Equipment({
    required String equipmentID,
    required String equipmentTag,
    required String equipmentPhoto,
    required String equipmentName,
    required String zoneName,
    required String departmentName,
    required String sectionName,
    required String repairBelongsTo,
    required bool equipmentFailureStatus,
  }) = _Equipment;

  factory Equipment.fromJson(Map<String, dynamic>? json) =>
      _$EquipmentFromJson(json!);
}
