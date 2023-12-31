import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:industry_maintenance_app/core/classes/text_controllers.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/create_user_usecase.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login_user_usecase.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final CreateUserUseCase createUserUseCase;
  final LoginUserUseCase loginUserUseCase;
  AuthCubit({required this.createUserUseCase, required this.loginUserUseCase}) : super(AuthState.initial());


  loginPage() {
    emit(const AuthState.initial());
  }

  authPage(){
    emit(const AuthState.isAuthPage());
  }

  Future<void> loginUser(loginPassword, login) async{
    final result = await loginUserUseCase(
        LoginParams(
            userPassword: loginPassword,
            userLogin: login));
    result.fold((failure){
      emit(const AuthState.loginFailed('Unable to login user'));
    }, (result){
      emit(AuthState.loginSuccess(result));
    });
  }

}
