import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/widgets/app_bar/cubit/app_bar_cubit.dart';

class CustomAppBar extends HookWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.uid,
    required this.appBarTitle,
    required this.autoLeading,
    required this.scaffoldKey,
    super.key,
  });
  final String appBarTitle;
  final String? uid;
  final bool autoLeading;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final appBarCubit = useBloc<AppBarCubit>(closeOnDispose: false);
    final appBarState = useBlocBuilder(appBarCubit);

    useBlocListener<AppBarCubit, AppBarState>(appBarCubit,
        (bloc, current, context) {
      current.mapOrNull(
        userLoggedOut: (_) => context.goNamed('start_page'),
      );
    });

    useEffect(
      () {
        appBarCubit.getUser(uid);
        return null;
      },
      [appBarCubit],
    );

    return AppBar(
      title: Text(appBarTitle.toUpperCase()),
      centerTitle: true,
      automaticallyImplyLeading: autoLeading,
      actions: [
        GestureDetector(
          onTap: () async {
            scaffoldKey.currentState!.openEndDrawer();
          },
          child: CircleAvatar(
            backgroundColor: Colors.teal,
            radius: 30,
            child: appBarState.whenOrNull(
              userLoggedIn: (user) => Text(
                user.userName[0] + user.userSurName[0],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      // appBarState.whenOrNull(
      //   userLoggedOut: () => const SizedBox(),
      //   userLoggedIn: (user) => GestureDetector(
      //     onTap: (){
      //       appBarCubit.logOutUser();
      //       // context.goNamed('start_page');
      //     },
      //       child: Text(user.userName)),
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}