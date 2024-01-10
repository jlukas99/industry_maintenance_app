import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user_auth/domain/entities/user.dart';
import '../../../user_auth/domain/usecases/get_user.dart';
import '../../domain/entities/department.dart';
import '../../domain/usecases/fetch_departments_usecase.dart';
import '../../domain/usecases/find_department_usecase.dart';

part 'department_state.dart';
part 'department_cubit.freezed.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  final GetUserUseCase getUserUseCase;
  final FetchDepartmentsUseCase fetchDepartmentsUseCase;
  final FindDepartmentUseCase findDepartmentUseCase;
  DepartmentCubit({
    required this.findDepartmentUseCase,
    required this.fetchDepartmentsUseCase,
    required this.getUserUseCase,
  }) : super(const DepartmentState.initial());

  StreamSubscription<List<Department>>? _streamSubscription;
  StreamSubscription<List<Department>>? _findSubscription;

  Future<void> departmentInit({userID, zoneName}) async{
    emit(const DepartmentState.loadingDepartments());
    final result = await getUserUseCase(GetUserParams(userID: userID));
    result.fold((failed){
      emit(const DepartmentState.loadingError('Coś poszło nie tak'));
    }, (user){
      fetchDepartmentData(user: user, zoneName: zoneName);
    });
  }

  Future<void> fetchDepartmentData({user, zoneName}) async{
    final result = await fetchDepartmentsUseCase(FetchDepartmentParams(zoneName: zoneName));
    result.fold((failure){
      emit(const DepartmentState.loadingError('Coś poszło nie tak'));
    }, (departments) async{
      _streamSubscription = departments.listen((event) {
        if(event.isEmpty){
          emit(const DepartmentState.departmentPageEmpty('Brak wydziałów'));
        }else{
          emit(DepartmentState.loadingSuccess(departments: event, user: user));
        }
      });
    });
  }

  Future<void> findDepartment(departmentName) async{
    final result = await findDepartmentUseCase(FindDepartmentParams(departmentName: departmentName));
    result.fold((failure){
      emit(const DepartmentState.loadingError('Coś poszło nie tak'));
    }, (departments) async{
      _findSubscription = departments.listen((event) {
        if(event.isEmpty){
          emit(const DepartmentState.departmentPageEmpty('dupa'));
        }else{
          emit(DepartmentState.searchDepartmentSuccess(event));
        }
      });
    });
  }

  @override
  Future<void> close() async{
    _streamSubscription?.cancel();
    _findSubscription?.cancel();
    super.close();
  }
}
