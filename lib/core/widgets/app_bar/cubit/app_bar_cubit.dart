import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/get_user.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/log_out_user_usecase.dart';

part 'app_bar_cubit.freezed.dart';
part 'app_bar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  AppBarCubit({
    required this.getUserUseCase,
    required this.logOutUserUseCase,
  }) : super(const AppBarState.initial());

  final LogOutUserUseCase logOutUserUseCase;
  final GetUserUseCase getUserUseCase;

  Future<void> getUser(String? userID) async {
    final result = await getUserUseCase(GetUserParams(userID: userID ?? ''));
    result.fold((failure) {
      emit(const AppBarState.userLoggedOut());
    }, (user) {
      emit(AppBarState.userLoggedIn(user));
    });
  }

  Future<void> logOutUser() async {
    final result = await logOutUserUseCase();
    result.fold((failure) {
      return null;
    }, (success) {
      emit(const AppBarState.userLoggedOut());
    });
  }
}
