import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:industry_maintenance_app/features/user_auth/domain/usecases/create_user_usecase.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required this.createUserUseCase,
  }) : super(const SignInState.initial());

  final CreateUserUseCase createUserUseCase;

  Future<void> checkUser() async {}

  Future<void> createUser({
    required String userName,
    required String userSurName,
    required String userLogin,
    required String userPassword,
  }) async {
    final result = await createUserUseCase(
      UserParams(
        userPassword: userPassword,
        userLogin: userLogin,
        userSurName: userSurName,
        userName: userName,
      ),
    );

    result.fold((failure) {}, (result) {});
  }
}
