part of 'main_page_cubit.dart';

@freezed
class MainPageState with _$MainPageState {
  const factory MainPageState.initial() = _Initial;

  const factory MainPageState.mainPageInitialized(MyUser user) = _MainPageInitialized;

  const factory MainPageState.mainPageError() = _MainPageError;
  const factory MainPageState.shutDownButtonPressed() = _ShutDownButtonPressed;
  const factory MainPageState.factoryButtonPressed() = _FactoryButtonPressed;
  const factory MainPageState.failureButtonPressed() = _FailureButtonPressed;
}
