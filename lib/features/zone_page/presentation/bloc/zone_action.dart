part of 'zone_cubit.dart';

@freezed
class ZoneAction with _$ZoneAction {
  const factory ZoneAction.openPage(String path) = _OpenPage;
  const factory ZoneAction.toggleSearch() = _ToggleSearch;
}
