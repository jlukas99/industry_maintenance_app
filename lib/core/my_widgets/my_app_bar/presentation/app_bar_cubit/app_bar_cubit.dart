import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/get_user.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/logOut_user_usecase.dart';

import '../../../../../features/user_auth/domain/entities/user.dart';


part 'app_bar_state.dart';
part 'app_bar_cubit.freezed.dart';

class AppBarCubit extends Cubit<AppBarState> {
  final LogOutUserUseCase logOutUserUseCase;
  final GetUserUseCase getUserUseCase;
  AppBarCubit({required this.getUserUseCase, required this.logOutUserUseCase}) : super(const AppBarState.initial());

  Future<void> getUser({userID}) async{
    final result = await getUserUseCase(GetUserParams(userID: userID));
    result.fold((failure){
      emit(const AppBarState.userLoggedOut());
    }, (user){
      emit(AppBarState.userLoggedIn(user));
    });
  }

  Future<void> logOutUser() async{
    final result = await logOutUserUseCase();
    result.fold((failure){
      return null;
    },(success){
      emit(const AppBarState.userLoggedOut());
    });
  }

}
