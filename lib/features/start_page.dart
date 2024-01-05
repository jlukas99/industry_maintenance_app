import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/dependency_injection.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/entities/user.dart';
import 'package:industry_maintenance_app/features/user_auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:industry_maintenance_app/features/user_auth/presentation/bloc/login_cubit/login_cubit.dart';
import 'package:industry_maintenance_app/features/user_auth/presentation/pages/login_page.dart';

class StartPage extends HookWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final LoginCubit login = LoginCubit(loginUserUseCase: depInjection.get());
    // final args = ModalRoute.of(context)?.settings.arguments as User;
    // final cubit = context.select((LoginCubit cubit) => cubit.user.value);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person_outline_rounded, size: 80,),
            ),
            const SizedBox(height: 40.0,),
            // !state.userLoggedIn?
            CupertinoButton(
              color: Colors.black,
              onPressed: () {
                // Get.toNamed('/login_page');
                context.go('/login_page');
                // context.read<CreateUserCredentialsBloc>().add(const CreateUserCredentialsEvent.started());
              },
              child: const Text('Logowanie / Rejestracja'),

            )
                // : SizedBox(),
          ],
        ),
      ),
    );
  }
}
