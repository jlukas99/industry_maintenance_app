import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/features/my_app_bar/presentation/app_bar_cubit/app_bar_cubit.dart';

class CustomAppBar extends HookWidget {
  final String? uid;
  const CustomAppBar({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appBarCubit = useBloc<AppBarCubit>();
    final appBarState = useBlocBuilder(appBarCubit);
    useBlocListener<AppBarCubit, AppBarState>(appBarCubit, (bloc, current, context) {
      current.mapOrNull(
        userLoggedOut: (_) => context.goNamed('start_page'),
      );
    });

    useEffect((){
      appBarCubit.getUser(userID: uid);
      return null;
    },
    [appBarCubit],
    );

    return AppBar(
      title: appBarState.whenOrNull(
        userLoggedOut: () => const SizedBox(),
        userLoggedIn: (user) => GestureDetector(
          onTap: (){
            appBarCubit.logOutUser();
            // context.goNamed('start_page');
          },
            child: Text(user.userName)),
      ),

    );
  }
}
