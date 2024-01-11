import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:industry_maintenance_app/features/user_auth/domain/usecases/login_user_usecase.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.loginUserUseCase,
  }) : super(const LoginState.initial());

  final LoginUserUseCase loginUserUseCase;

  Future<void> loginUser({
    required String userPassword,
    required String userLogin,
  }) async {
    emit(const LoginState.loginProgress());

    final result = await loginUserUseCase(
      LoginParams(userPassword: userPassword, userLogin: userLogin),
    );

    result.fold((failure) {
      emit(const LoginState.loginFailure('Unable to login user'));
      emit(const LoginState.initial());
    }, (uid) {
      emit(LoginState.loginSuccess(uid));
    });
  }
}
