import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/get_user.dart';

import '../../../user_auth/domain/entities/user.dart';
import '../../../user_auth/domain/usecases/login_user_usecase.dart';

part 'main_page_state.dart';
part 'main_page_cubit.freezed.dart';

class MainPageCubit extends Cubit<MainPageState> {
  final GetUserUseCase getUserUseCase;
  MainPageCubit({required this.getUserUseCase}) : super(const MainPageState.initial());

  Future<void> initMainPage({userID}) async{
    final result = await getUserUseCase(GetUserParams(userID: userID));
    result.fold((failure){
      return null;
    }, (user){
      emit(MainPageState.mainPageInitialized(user));
    });
  }
}
