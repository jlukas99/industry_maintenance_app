part of 'department_cubit.dart';

@freezed
class DepartmentState with _$DepartmentState {
  const factory DepartmentState.initial() = _Initial;

  const factory DepartmentState.loadingDepartments() = _LoadingDepartments;
  const factory DepartmentState.loadingError(String message) = _LoadingError;
  const factory DepartmentState.loadingSuccess({List<Department>? departments,  MyUser? user}) = _LoadingSuccess;
  const factory DepartmentState.searchDepartmentSuccess(List<Department> departments) = _SearchDepartmentSuccess;
  const factory DepartmentState.departmentPageEmpty(String message) = _DepartmentPageEmpty;
}
