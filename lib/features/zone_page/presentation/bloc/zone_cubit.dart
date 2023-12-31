import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/entities/zone.dart';
import '../../domain/usecases/delete_zone_usecase.dart';
import '../../domain/usecases/fetch_zone_usecase.dart';


part 'zone_state.dart';
part 'zone_cubit.freezed.dart';

class ZoneCubit extends Cubit<ZoneState> {
  final DeleteZoneUseCase deleteZoneUeCase;
  final FetchZoneUseCase fetchZoneUseCase;
  ZoneCubit({
    required this.deleteZoneUeCase,
    required this.fetchZoneUseCase,
  }) : super(const ZoneState.lookingForZone());


  Future<void> goToAddZonePage() async{
    emit(const ZoneState.addZoneButtonPressed());
    await Future.delayed(const Duration(seconds: 1));
    emit(const ZoneState.initial());
  }


  Future<void> fetchZones() async{
    emit(const ZoneState.lookingForZone());
    final result = await fetchZoneUseCase();
    result.fold((failed){
      emit(const ZoneState.zonePageError('Błąd'));
    }, (result){
      result.listen((event) {
        if(event.isEmpty){
          emit(const ZoneState.zonePageIsEmpty('Pusto'));
        }else{
          emit(ZoneState.zoneStateHasData(event));

        }
      });
    });
  }

  @override
  Future<void> close() {
    fetchZones();
    return super.close();
  }

}
