part of 'app_bar_cubit.dart';

@freezed
class AppBarState with _$AppBarState {
  const factory AppBarState.initial() = _Initial;

  const factory AppBarState.userLoggedIn(MyUser user) = _UserLoggedIn;
  const factory AppBarState.userLoggedOut() = _UserLoggedOut;
}
