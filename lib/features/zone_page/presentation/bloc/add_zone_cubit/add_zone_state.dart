part of 'add_zone_cubit.dart';

@freezed
class AddZoneState with _$AddZoneState {
  const factory AddZoneState.initial() = _Initial;

  const factory AddZoneState.createZoneSuccess(String message) = _CreateZoneSuccess;
  const factory AddZoneState.createZoneFailure(String message) = _CreateZoneFailure;
  const factory AddZoneState.zoneExists(String message) = _ZoneExists;
  const factory AddZoneState.zoneExistsError(String message) = _ZoneExistsError;
  const factory AddZoneState.addingNewZone() = _AddingNewZone;
}
