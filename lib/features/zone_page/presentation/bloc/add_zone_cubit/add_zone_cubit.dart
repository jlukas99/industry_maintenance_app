import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:industry_maintenance_app/features/zone_page/domain/usecases/create_zone_usecase.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/zone_exists_usecase.dart';

part 'add_zone_state.dart';
part 'add_zone_cubit.freezed.dart';

class AddZoneCubit extends Cubit<AddZoneState> {
  AddZoneCubit({
    required this.createZoneUseCase,
    required this.zoneExistsUseCase,
  }) : super(const AddZoneState.initial());

  final ZoneExistsUseCase zoneExistsUseCase;
  final CreateZoneUseCase createZoneUseCase;

  Future<void> createNewZone({
    required String zoneName,
    required String zonePicture,
  }) async {
    emit(const AddZoneState.addingNewZone());

    final result = await createZoneUseCase(
      ZoneParams(zoneName: zoneName, zoneID: '', zonePicture: zonePicture),
    );

    await result.fold((failure) {
      emit(
        const AddZoneState.createZoneFailure(
          'Nie można utworzyć nowej strefy',
        ),
      );
    }, (result) async {
      emit(const AddZoneState.createZoneSuccess('Uworzono nową strefę'));
    });
  }

  Future<void> checkForZone({
    required String zoneName,
    required String zonePicture,
  }) async {
    final result = await zoneExistsUseCase(
      ZoneExistsParams(zoneName: zoneName),
    );

    await result.fold((failure) {
      emit(const AddZoneState.zoneExistsError('Upps...Coś poszło nie tak'));
    }, (result) async {
      if (result == true) {
        await createNewZone(zoneName: zoneName, zonePicture: zonePicture);
      } else {
        emit(const AddZoneState.zoneExists('Rejon o tej nazwie istnieje'));

        Future.delayed(const Duration(seconds: 1), () {
          emit(const AddZoneState.initial());
        });
      }
    });
  }
}
