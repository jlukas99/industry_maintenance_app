part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.checkingNewUser() = _CheckingNewUser;
  const factory SignInState.userAlreadyExist(String message) = _UserAlreadyExist;
  const factory SignInState.userSlotEmpty()  = _UserSlotEmpty;
  const factory SignInState.signInSuccess(String message) = _SignInSuccess;
  const factory SignInState.signInFailure(String message) = _SignInFailure;
}
