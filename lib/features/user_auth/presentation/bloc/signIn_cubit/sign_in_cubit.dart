import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/create_user_usecase.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  final CreateUserUseCase createUserUseCase;
  SignInCubit({required this.createUserUseCase}) : super(const SignInState.initial());

  Future<void> checkUser() async{}

  Future<void> createUser({userName, userSurName, userLogin, userPassword}) async{
    final result = await createUserUseCase(
        UserParams(
            userPassword: userPassword,
            userLogin: userLogin,
            userSurName: userSurName,
            userName: userName));
    result.fold((failure){}, (result){});
  }

}
