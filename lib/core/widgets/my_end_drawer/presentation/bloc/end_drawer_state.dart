part of 'end_drawer_cubit.dart';

@freezed
class EndDrawerState with _$EndDrawerState {
  const factory EndDrawerState.initial() = _Initial;

  const factory EndDrawerState.userLoggedOut(String message) =_UserLoggedOut;
  const factory EndDrawerState.logOutError(String message) = _LogOutError;
}
