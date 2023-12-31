import 'package:bloc/bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login_user_usecase.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUserUseCase loginUserUseCase;
  LoginCubit({required this.loginUserUseCase}) : super(const LoginState.initial());

  // User user = User.empty();
  // bool userLoggedIn = false;

  Future<void> loginUser({required userPassword, required userLogin}) async{
    emit(const LoginState.loginProgress());
    final result = await loginUserUseCase(LoginParams(userPassword: userPassword, userLogin: userLogin));
    result.fold((failure){
      emit(const LoginState.loginFailure('Unable to login user'));
      emit(const LoginState.initial());
    }, (result){
      emit(LoginState.loginSuccess(user: result));
      // user.value = result;
    });
  }

}
