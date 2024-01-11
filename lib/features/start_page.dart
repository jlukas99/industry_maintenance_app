
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class StartPage extends HookWidget {
  const StartPage({super.key});

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

            ),
                // : SizedBox(),
          ],
        ),
      ),
    );
  }
}
