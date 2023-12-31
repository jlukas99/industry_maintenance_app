part of 'main_page_cubit.dart';

@freezed
class MainPageState with _$MainPageState {
  const factory MainPageState.initial() = _Initial;
  const factory MainPageState.error() = _Error;
  const factory MainPageState.shutDownsPressed() = _ShutDownPressed;
  const factory MainPageState.factoryPressed() = _FactoryPressed;
  const factory MainPageState.failuresPressed() = _FailuresPressed;
}
