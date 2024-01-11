import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:industry_maintenance_app/features/user_auth/domain/usecases/log_out_user_usecase.dart';

part 'end_drawer_state.dart';
part 'end_drawer_cubit.freezed.dart';

class EndDrawerCubit extends Cubit<EndDrawerState> {
  EndDrawerCubit({
    required this.logOutUserUseCase,
  }) : super(const EndDrawerState.initial());

  final LogOutUserUseCase logOutUserUseCase;

  Future<void> logOutUser() async {
    final result = await logOutUserUseCase();
    result.fold((failure) {
      emit(const EndDrawerState.logOutError('Coś poszło nie tak...'));
    }, (success) {
      emit(const EndDrawerState.userLoggedOut('Wylogowałeś się pomyślnie'));
    });
  }
}
