import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/widgets/custom_snackbar_widget.dart';
import 'package:industry_maintenance_app/core/widgets/my_end_drawer/presentation/bloc/end_drawer_cubit.dart';

class MyEndDrawer extends HookWidget {
  const MyEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final snackBar = MySnackBar();

    final drawerCubit = useBloc<EndDrawerCubit>();

    useBlocListener<EndDrawerCubit, EndDrawerState>(drawerCubit,
        (bloc, current, context) {
      current.whenOrNull(
        userLoggedOut: (value) {
          snackBar.showSnackBar(value, context);
          context.goNamed('start_page');
        },
        logOutError: (value) => snackBar.showSnackBar(value, context),
      );
    });

    return Drawer(
      width: MediaQuery.of(context).size.width / 1.6,
      elevation: 16.0,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          height: 80,
        ),
        DrawerButton(
          endDrawerCubit: drawerCubit,
          key: const Key('profile_button'),
          buttonText: 'Mój profil',
        ),
        const SizedBox(
          height: 12.0,
        ),
        DrawerButton(
          endDrawerCubit: drawerCubit,
          key: const Key('failure_button'),
          buttonText: 'Usterki',
        ),
        const SizedBox(
          height: 12.0,
        ),
        DrawerButton(
          endDrawerCubit: drawerCubit,
          key: const Key('shutDown_button'),
          buttonText: 'Postoje',
        ),
        const SizedBox(
          height: 12.0,
        ),
        DrawerButton(
          endDrawerCubit: drawerCubit,
          key: const Key('factory_button'),
          buttonText: 'Fabryka',
        ),
        const SizedBox(
          height: 12.0,
        ),
        DrawerButton(
          endDrawerCubit: drawerCubit,
          key: const Key('logOut_button'),
          buttonText: 'Wyloguj się',
        ),
      ],),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    required this.buttonText,
    required this.endDrawerCubit,
    super.key,
  });
  final String buttonText;
  final EndDrawerCubit endDrawerCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CupertinoButton(
          // color: Colors.white60,
          child: Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Text(
                    buttonText.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,),
                  ),),
            ],
          ),
          onPressed: () {
            if (key == const Key('logOut_button')) {
              endDrawerCubit.logOutUser();
            }
          },),
    );
  }
}
