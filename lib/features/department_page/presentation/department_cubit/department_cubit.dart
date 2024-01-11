import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/features/department_page/domain/entities/department.dart';
import 'package:industry_maintenance_app/features/department_page/domain/usecases/fetch_departments_usecase.dart';
import 'package:industry_maintenance_app/features/department_page/domain/usecases/find_department_usecase.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/get_user.dart';

part 'department_action.dart';
part 'department_cubit.freezed.dart';
part 'department_state.dart';

class DepartmentCubit extends ActionCubit<DepartmentState, DepartmentAction> {
  DepartmentCubit({
    required this.findDepartmentUseCase,
    required this.fetchDepartmentsUseCase,
    required this.getUserUseCase,
  }) : super(const DepartmentState.initial());

  final GetUserUseCase getUserUseCase;
  final FetchDepartmentsUseCase fetchDepartmentsUseCase;
  final FindDepartmentUseCase findDepartmentUseCase;

  StreamSubscription<List<Department>>? _streamSubscription;
  StreamSubscription<List<Department>>? _findSubscription;

  Future<void> departmentInit({
    required String userID,
    required String zoneName,
  }) async {
    emit(const DepartmentState.loadingDepartments());
    final result = await getUserUseCase(GetUserParams(userID: userID));
    result.fold((failed) {
      emit(const DepartmentState.loadingError('Coś poszło nie tak'));
    }, (user) {
      fetchDepartmentData(user: user, zoneName: zoneName);
    });
  }

  Future<void> fetchDepartmentData({
    required MyUser user,
    required String zoneName,
  }) async {
    final result = await fetchDepartmentsUseCase(
      FetchDepartmentParams(zoneName: zoneName),
    );

    return result.fold((failure) {
      emit(const DepartmentState.loadingError('Coś poszło nie tak'));
    }, (departments) async {
      _streamSubscription = departments.listen((event) {
        if (event.isEmpty) {
          emit(const DepartmentState.departmentPageEmpty('Brak wydziałów'));
        } else {
          emit(DepartmentState.loadingSuccess(departments: event, user: user));
        }
      });
    });
  }

  Future<void> findDepartment(String departmentName) async {
    final result = await findDepartmentUseCase(
      FindDepartmentParams(departmentName: departmentName),
    );

    return result.fold((failure) {
      emit(const DepartmentState.loadingError('Coś poszło nie tak'));
    }, (departments) async {
      _findSubscription = departments.listen((event) {
        if (event.isEmpty) {
          emit(const DepartmentState.departmentPageEmpty('dupa'));
        } else {
          emit(DepartmentState.searchDepartmentSuccess(event));
        }
      });
    });
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    await _findSubscription?.cancel();
    await super.close();
  }
}
