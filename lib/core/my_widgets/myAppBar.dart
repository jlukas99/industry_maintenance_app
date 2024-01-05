import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/dependency_injection.dart';
import '../../features/user_auth/presentation/bloc/login_cubit/login_cubit.dart';

class MyAppBar extends HookWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    print(loginCubit.state);
    final loginState = useBlocBuilder(loginCubit);
    return BlocProvider(
      create: (context) => loginCubit,
      child: AppBar(
        title: loginState.whenOrNull(
            loginSuccess: (value) => Text('dd')
        ),
      ),
    );
  }
}