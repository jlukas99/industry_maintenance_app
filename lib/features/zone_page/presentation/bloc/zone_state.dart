part of 'zone_cubit.dart';

@freezed
class ZoneState with _$ZoneState {
  const factory ZoneState.initial() = _Initial;

  ///page is looking for zones
  const factory ZoneState.lookingForZone() =_LookingForZone;
  ///page has no data (zones are empty)
  const factory ZoneState.zonePageIsEmpty(String message) = _ZonePageIsEmpty;
  ///page has an error
  const factory ZoneState.zonePageError(String message) = _ZonePageError;
  ///zone initialized (we have zones and user is logged in)
  const factory ZoneState.zonePageInitialized({List<FactoryZone>? zones, MyUser? user}) = _ZonePageInitialized;
  ///looking for zone state
  const factory ZoneState.searchForZone({List<FactoryZone>? zones}) = _SearchForZone;
}
