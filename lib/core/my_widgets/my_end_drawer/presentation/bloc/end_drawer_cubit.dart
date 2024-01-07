import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../features/user_auth/domain/usecases/logOut_user_usecase.dart';

part 'end_drawer_state.dart';
part 'end_drawer_cubit.freezed.dart';

class EndDrawerCubit extends Cubit<EndDrawerState> {
  final LogOutUserUseCase logOutUserUseCase;
  EndDrawerCubit({required this.logOutUserUseCase}) : super(const EndDrawerState.initial());

  Future<void> logOutUser() async{
    final result = await logOutUserUseCase();
    result.fold((failure){
      emit(const EndDrawerState.logOutError('Coś poszło nie tak...'));
    }, (success){
      emit(const EndDrawerState.userLoggedOut('Wylogowałeś się pomyślnie'));
    });
  }

}
