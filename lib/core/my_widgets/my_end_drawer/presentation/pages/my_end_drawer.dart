import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/my_widgets/custom_snackbar_widget.dart';
import 'package:industry_maintenance_app/core/my_widgets/my_end_drawer/presentation/bloc/end_drawer_cubit.dart';

class MyEndDrawer extends HookWidget{
  const MyEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    final _snackBar = MySnackBar();

    final drawerCubit = useBloc<EndDrawerCubit>();
    final drawerState = useBlocBuilder(drawerCubit);
    useBlocListener<EndDrawerCubit, EndDrawerState>(drawerCubit, (bloc, current, context) {
      current.whenOrNull(
        userLoggedOut: (value) {
          _snackBar.showSnackBar(value, context);
          context.goNamed('start_page');
        },
        logOutError: (value) => _snackBar.showSnackBar(value, context),
      );
    });

    return Drawer(
      width: MediaQuery.of(context).size.width/1.6,
      elevation: 16.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 80,),
          DrawerButton(
            endDrawerCubit: drawerCubit,
            key: Key('profile_button'),
            buttonText: 'Mój profil',
          ),
          const SizedBox(height: 12.0,),
          DrawerButton(
            endDrawerCubit: drawerCubit,
            key: Key('failure_button'),
            buttonText: 'Usterki',
          ),
          const SizedBox(height: 12.0,),
          DrawerButton(
            endDrawerCubit: drawerCubit,
            key: Key('shutDown_button'),
            buttonText: 'Postoje',
          ),
          const SizedBox(height: 12.0,),
          DrawerButton(
            endDrawerCubit: drawerCubit,
            key: Key('factory_button'),
            buttonText: 'Fabryka',
          ),
          const SizedBox(height: 12.0,),
          DrawerButton(
            endDrawerCubit: drawerCubit,
            key: Key('logOut_button'),
            buttonText: 'Wyloguj się',
          ),
        ]
      ),
      );
  }
  
  
}

class DrawerButton extends StatelessWidget {
  final String buttonText;
  final EndDrawerCubit endDrawerCubit;
  const DrawerButton({
    required this.buttonText,
    required this.endDrawerCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      // color: Colors.white60,
        child: Text(buttonText.toUpperCase()), onPressed: (){
          if(key == const Key('logOut_button')){
            endDrawerCubit.logOutUser();
          }
    });
  }
}