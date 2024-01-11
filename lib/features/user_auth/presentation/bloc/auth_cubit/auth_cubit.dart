import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/create_user_usecase.dart';

import 'package:industry_maintenance_app/features/user_auth/domain/usecases/login_user_usecase.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.createUserUseCase,
    required this.loginUserUseCase,
  }) : super(const AuthState.initial());

  final CreateUserUseCase createUserUseCase;
  final LoginUserUseCase loginUserUseCase;

  void loginPage() => emit(const AuthState.initial());

  void authPage() => emit(const AuthState.isAuthPage());

  Future<void> loginUser(String loginPassword, String login) async {
    final result = await loginUserUseCase(
      LoginParams(
        userPassword: loginPassword,
        userLogin: login,
      ),
    );

    result.fold((failure) {
      emit(const AuthState.loginFailed('Unable to login user'));
    }, (uid) {
      emit(AuthState.loginSuccess(uid));
    });
  }
}
