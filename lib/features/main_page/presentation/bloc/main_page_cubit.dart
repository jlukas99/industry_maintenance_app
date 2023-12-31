import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_page_state.dart';
part 'main_page_cubit.freezed.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(const MainPageState.initial());

  Future<void> pressFactory() async{
    emit(const MainPageState.factoryPressed());
    await Future.delayed(const Duration(milliseconds: 1200));
    emit(const MainPageState.initial());
  }

  void pressShutDown(){
    emit(const MainPageState.shutDownsPressed());
  }

  void pressFailures(){
    emit(const MainPageState.failuresPressed());
  }
}
