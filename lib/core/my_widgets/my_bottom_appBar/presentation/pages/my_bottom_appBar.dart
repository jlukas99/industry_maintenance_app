import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/my_widgets/my_bottom_appBar/presentation/bloc/bottom_app_bar_cubit.dart';

class MyBottomAppBar extends HookWidget{
  final String pageName;
  final String uid;
  final TextEditingController textEditingController;
  const MyBottomAppBar({super.key, required this.pageName, required this.uid, required this.textEditingController});


  @override
  Widget build(BuildContext context) {

    final bottomAppBarCubit = useBloc<BottomAppBarCubit>();
    final bottomAppBarState = useBlocBuilder(bottomAppBarCubit);
    useBlocListener<BottomAppBarCubit, BottomAppBarState>(bottomAppBarCubit, (bloc, current, context) { });

    return BottomAppBar(
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){
            if(pageName == 'factory_zone'){
              context.pushNamed('add_factory_zone', pathParameters: {'uid' : uid});
            }

          }, icon: const Icon(Icons.add, size: 40,)),
          IconButton(onPressed: (){
            textEditingController.text = '';
            if(pageName == 'factory_zone'){
              bottomAppBarCubit.findZone('');
            }
          }, icon: const Icon(Icons.search, size: 40,)),
          IconButton(onPressed: (){
            context.goNamed('main_page', pathParameters: {'uid': uid});
          }, icon: const Icon(Icons.home, size: 40,)),
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}