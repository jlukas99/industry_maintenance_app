part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loginSuccess(User user) = _LoginSuccess;
  const factory AuthState.authSuccess(String message) = _AuthSuccess;
  const factory AuthState.loginFailed(String failMessage) = _LoginFailed;
  // const factory AuthState.isLoginPage() = _IsLoginPage;
  const factory AuthState.isAuthPage() = _IsAuthPage;
}
