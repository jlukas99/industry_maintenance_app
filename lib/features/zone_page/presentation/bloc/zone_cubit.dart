import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/get_user.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/entities/zone.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/delete_zone_usecase.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/fetch_zone_usecase.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/usecases/find_zone_usecase.dart';

part 'zone_action.dart';
part 'zone_cubit.freezed.dart';
part 'zone_state.dart';

class ZoneCubit extends ActionCubit<ZoneState, ZoneAction> {
  ZoneCubit({
    required this.deleteZoneUeCase,
    required this.fetchZoneUseCase,
    required this.getUserUseCase,
    required this.findZoneUseCase,
  }) : super(const ZoneState.initial());
  final DeleteZoneUseCase deleteZoneUeCase;
  final FetchZoneUseCase fetchZoneUseCase;
  final GetUserUseCase getUserUseCase;
  final FindZoneUseCase findZoneUseCase;

  StreamSubscription<List<FactoryZone>>? _zoneSubscription;
  StreamSubscription<List<FactoryZone>>? _lookingForZone;

  ///jak zdeklarować zmienną w Cubicie, aby korzystać wewnątrz cubita np: User? user
  ///
  MyUser? _user;

  ///initZonePage => takes user and additionally fetch all zones on zone page from ['fetchZones'] function

  Future<void> initZonePage({required String userID}) async {
    final result = await getUserUseCase(GetUserParams(userID: userID));

    result.fold((failure) {
      emit(const ZoneState.zonePageError('błąd logowania'));
    }, (user) {
      _user = user;
      fetchZones();
    });
  }

  ///fetching zones and return to zone page user and zones

  Future<void> fetchZones() async {
    emit(const ZoneState.lookingForZone());
    final result = await fetchZoneUseCase();
    await result.fold((failed) {
      emit(const ZoneState.zonePageError('Błąd'));
    }, (result) async {
      _zoneSubscription = result.listen((event) {
        if (event.isEmpty) {
          emit(const ZoneState.zonePageIsEmpty('Pusto'));
        } else {
          emit(ZoneState.zonePageInitialized(zones: event, user: _user));
        }
      });
    });
  }

  Future<void> findZone(String zoneName) async {
    final result = await findZoneUseCase(FindZoneParams(zoneName: zoneName));
    await result.fold((failure) {
      emit(const ZoneState.zonePageError('Błąd'));
    }, (list) async {
      _lookingForZone = list.listen((event) {
        if (event.isEmpty) {
          emit(const ZoneState.zonePageIsEmpty('Nie ma takiej strefy'));
        } else {
          emit(ZoneState.zonePageInitialized(zones: event, user: _user));
        }
      });
    });
  }

  void openPage(String path) => dispatch(ZoneAction.openPage(path));

  void toggleSearch() => dispatch(const ZoneAction.toggleSearch());

  @override
  Future<void> close() async {
    await _zoneSubscription?.cancel();
    await _lookingForZone?.cancel();
    await super.close();
  }
}
