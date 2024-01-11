import 'package:freezed_annotation/freezed_annotation.dart';
part 'section.freezed.dart';
part 'section.g.dart';

@freezed
class FactorySection with _$FactorySection {
  const factory FactorySection({
    required String sectionID,
    required String sectionName,
    required String sectionPhoto,
    required String zoneName,
    required String departmentName,
  }) = _FactorySection;

  factory FactorySection.fromJson(Map<String, dynamic>? json) =>
      _$FactorySectionFromJson(json!);
}
