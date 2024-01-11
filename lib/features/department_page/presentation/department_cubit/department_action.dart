part of 'department_cubit.dart';

@freezed
class DepartmentAction with _$DepartmentAction {
  const factory DepartmentAction.showSnackbar({
    required String message,
    required bool isError,
  }) = _ShowSnackbar;

  const factory DepartmentAction.openDepartament({
    required String departamentId,
  }) = _OpenDepartament;
}
