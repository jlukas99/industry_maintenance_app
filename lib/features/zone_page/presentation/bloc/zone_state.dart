part of 'zone_cubit.dart';

@freezed
class ZoneState with _$ZoneState {
  const factory ZoneState.initial() = _Initial;

  const factory ZoneState.lookingForZone() =_LookingForZone;
  const factory ZoneState.zonePageIsEmpty(String message) = _ZonePageIsEmpty;
  const factory ZoneState.zoneStateHasData(List<FactoryZone> zones) = _ZoneStateHasData;
  const factory ZoneState.zonePageError(String message) = _ZonePageError;
  const factory ZoneState.zonePageUserInit(MyUser user) = _ZonePageUserInit;


  ///dlaczego nie mogę użyć User.empty() jako default?
  ///
  /// czy w stanie init (na start) powinienem zawrzeć wszystkie zmienne, ktore potrzebuję zaraz po załadowaniu strony?

  const factory ZoneState.zonePageInitialized({List<FactoryZone>? zones, MyUser? user}) = _ZonePageInitialized;


  const factory ZoneState.addZoneButtonPressed() = _AddZoneButtonPressed;


}
