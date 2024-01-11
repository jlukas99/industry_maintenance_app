part of 'bottom_app_bar_cubit.dart';

@freezed
class BottomAppBarState with _$BottomAppBarState {
  const factory BottomAppBarState.initial() = _Initial;

  const factory BottomAppBarState.searchForElement(List<dynamic> list) = _SearchForElement;
  const factory BottomAppBarState.searchError(String message) = _SearchError;
  const factory BottomAppBarState.emptyResult(String message) = _EmptyResult;

}
