import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:industry_maintenance_app/features/department_page/domain/entities/department.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/find_zone_usecase.dart';

import '../../../../../features/department_page/domain/usecases/add_department_usecase.dart';
import '../../../../../features/department_page/domain/usecases/find_department_usecase.dart';
import '../../../../../features/zone_page/domain/entities/zone.dart';
import '../../../../../features/zone_page/domain/usecases/create_zone_usecase.dart';

part 'bottom_app_bar_state.dart';
part 'bottom_app_bar_cubit.freezed.dart';

class BottomAppBarCubit extends Cubit<BottomAppBarState> {
  // final CreateZoneUseCase createZoneUseCase;
  final FindZoneUseCase findZoneUseCase;
  // final AddDepartmentUseCase addDepartmentUseCase;
  final FindDepartmentUseCase findDepartmentUseCase;
  BottomAppBarCubit({
    required this.findDepartmentUseCase,
    // required this.addDepartmentUseCase,
    required this.findZoneUseCase,
    // required this.createZoneUseCase,
}) : super(const BottomAppBarState.initial());

  StreamSubscription<List<FactoryZone>>? _zoneSubscription;
  StreamSubscription<List<Department>>? _departmentSubscription;

  Future<void> findZone(zoneName) async{
    final result = await findZoneUseCase(FindZoneParams(zoneName: zoneName));
    result.fold((failure){
      emit(const BottomAppBarState.searchError('Błąd..'));
    }, (success){
      _zoneSubscription = success.listen((event) {
        if(event.isEmpty){
          emit(const BottomAppBarState.emptyResult('Brak stref'));
        }else{
          emit(BottomAppBarState.searchForElement(event));
        }
      });

    });
  }

  Future<void> findDepartment(departmentName) async{
    final result = await findDepartmentUseCase(FindDepartmentParams(departmentName: departmentName));
    result.fold((failure){
      emit(const BottomAppBarState.searchError('Błąd..'));
    }, (success){
      _departmentSubscription = success.listen((event) {
        if(event.isEmpty){
          emit(const BottomAppBarState.emptyResult('Brak wydziałów'));
        }else{
          emit(BottomAppBarState.searchForElement(event));
        }
      });

    });
  }

  @override
  Future<void> close() async{
    _departmentSubscription?.cancel();
    _zoneSubscription?.cancel();
    super.close();
  }

}
