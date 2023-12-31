import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/create_zone_usecase.dart';
import '../../../domain/usecases/zone_exists_usecase.dart';

part 'add_zone_state.dart';
part 'add_zone_cubit.freezed.dart';

class AddZoneCubit extends Cubit<AddZoneState> {
  final ZoneExistsUseCase zoneExistsUseCase;
  final CreateZoneUseCase createZoneUseCase;
  AddZoneCubit({required this.createZoneUseCase, required this.zoneExistsUseCase}) : super(const AddZoneState.initial());

  Future<void> createNewZone({zoneName, zonePicture}) async{
    emit(const AddZoneState.addingNewZone());
    final result = await createZoneUseCase(ZoneParams(zoneName: zoneName, zoneID: '', zonePicture: zonePicture));
    result.fold((failure){
      emit(const AddZoneState.createZoneFailure('Nie można utworzyć nowej strefy'));
    }, (result){
      emit(const AddZoneState.createZoneSuccess('Uworzono nową strefę'));
    });
  }

  Future<void> checkForZone({zoneName, zonePicture}) async{
    final result = await zoneExistsUseCase(ZoneExistsParams(zoneName: zoneName));
    result.fold((failure){
      emit(const AddZoneState.zoneExistsError('Upps...Coś poszło nie tak'));
    }, (result) async{
      if(result == true){
        await createNewZone(zoneName: zoneName, zonePicture: zonePicture);
      }else{
        emit(const AddZoneState.zoneExists('Rejon o tej nazwie istnieje'));
      }
    });
  }

}
