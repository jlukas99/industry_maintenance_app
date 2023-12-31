part of 'zone_cubit.dart';

@freezed
class ZoneState with _$ZoneState {
  const factory ZoneState.initial() = _Initial;

  const factory ZoneState.lookingForZone() =_LookingForZone;
  const factory ZoneState.zonePageIsEmpty(String message) = _ZonePageIsEmpty;
  const factory ZoneState.zoneStateHasData(List<FactoryZone> zoneList) = _ZoneStateHasData;
  const factory ZoneState.zonePageError(String message) = _ZonePageError;

  const factory ZoneState.addZoneButtonPressed() = _AddZoneButtonPressed;


}
