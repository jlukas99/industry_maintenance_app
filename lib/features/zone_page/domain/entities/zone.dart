import 'package:freezed_annotation/freezed_annotation.dart';
part 'zone.freezed.dart';
part 'zone.g.dart';

@freezed
class FactoryZone with _$FactoryZone {
  const factory FactoryZone({
    required String zoneName,
    required String zoneID,
    @Default('') String zonePicture,
  }) = _FactoryZone;
  factory FactoryZone.fromJson(Map<String, dynamic> json) =>
      _$FactoryZoneFromJson(json);
  factory FactoryZone.empty() => const FactoryZone(
        zoneName: '',
        zonePicture: '',
        zoneID: '',
      );
}
