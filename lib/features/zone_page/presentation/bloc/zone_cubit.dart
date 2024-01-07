import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/get_user.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/entities/zone.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/find_zone_usecase.dart';
import '../../../user_auth/domain/entities/user.dart';
import '../../domain/usecases/delete_zone_usecase.dart';
import '../../domain/usecases/fetch_zone_usecase.dart';


part 'zone_state.dart';
part 'zone_cubit.freezed.dart';

class ZoneCubit extends Cubit<ZoneState> {
  final DeleteZoneUseCase deleteZoneUeCase;
  final FetchZoneUseCase fetchZoneUseCase;
  final GetUserUseCase getUserUseCase;
  final FindZoneUseCase findZoneUseCase;
  ZoneCubit({
    required this.deleteZoneUeCase,
    required this.fetchZoneUseCase,
    required this.getUserUseCase,
    required this.findZoneUseCase,
  }) : super(const ZoneState.initial());

  StreamSubscription<List<FactoryZone>>? _zoneSubscription;
  StreamSubscription<List<FactoryZone>>? _lookingForZone;


  ///jak zdeklarować zmienną w Cubicie, aby korzystać wewnątrz cubita np: User? user
  ///
  MyUser? _user;

  ///initZonePage => takes user and additionally fetch all zones on zone page from ['fetchZones'] function

  Future<void> initZonePage({userID}) async{
    final result = await getUserUseCase(GetUserParams(userID: userID));
    result.fold((failure){
      emit(const ZoneState.zonePageError('błąd logowania'));
    }, (user){
      fetchZones(user);
    });
  }

  ///fetching zones and return to zone page user and zones

  Future<void> fetchZones(MyUser user) async{
    emit(const ZoneState.lookingForZone());
    final result = await fetchZoneUseCase();
    result.fold((failed){
      emit(const ZoneState.zonePageError('Błąd'));
    }, (result) async{
      _zoneSubscription = result.listen((event) {
        if(event.isEmpty){
          emit(const ZoneState.zonePageIsEmpty('Pusto'));
        }else{
          emit(ZoneState.zonePageInitialized(zones: event, user: user));
        }
      });
    });
  }

  Future<void> findZone(zoneName) async{
    final result = await findZoneUseCase(FindZoneParams(zoneName: zoneName));
    result.fold((failure){
      emit(const ZoneState.zonePageError('Błąd'));
    }, (list) async{
      _lookingForZone = list.listen((event) {
        if(event.isEmpty){
          emit(const ZoneState.zonePageIsEmpty('Nie ma takiej strefy'));
        }else{
          emit(ZoneState.searchForZone(zones: event));
        }

      });
    });
  }

  @override
  Future<void> close() async{
    _zoneSubscription?.cancel();
    _lookingForZone?.cancel();
    super.close();
  }
}
