import 'package:freezed_annotation/freezed_annotation.dart';
part 'department.freezed.dart';
part 'department.g.dart';

@freezed
class Department with _$Department {
  const factory Department({
    required String departmentName,
    required String zoneName,
    required String departmentPhoto,
    required String departmentID,
  }) = _Department;
  factory Department.fromJson(Map<String, dynamic>? json) =>
      _$DepartmentFromJson(json!);
  factory Department.empty() => const Department(
        departmentName: '',
        zoneName: '',
        departmentPhoto: '',
        departmentID: '',
      );
}
