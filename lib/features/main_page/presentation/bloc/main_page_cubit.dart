import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/get_user.dart';

part 'main_page_cubit.freezed.dart';
part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit({required this.getUserUseCase})
      : super(const MainPageState.initial());
  final GetUserUseCase getUserUseCase;

  Future<void> initMainPage({required String userID}) async {
    final result = await getUserUseCase(GetUserParams(userID: userID));
    result.fold((failure) {
      return null;
    }, (user) {
      emit(MainPageState.mainPageInitialized(user));
    });
  }
}
